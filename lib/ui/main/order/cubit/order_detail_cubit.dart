import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/di/injector.dart';

part 'order_detail_cubit.freezed.dart';
part 'order_detail_state.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit(this.orderId)
      : _orders = injector<OrderRepository>(),
        _payments = injector<PaymentRepository>(),
        _wallet = injector<WalletRepository>(),
        super(const OrderDetailState());

  static OrderDetailCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final int orderId;
  final OrderRepository _orders;
  final PaymentRepository _payments;
  final WalletRepository _wallet;

  Timer? _poll;

  @override
  Future<void> close() {
    _poll?.cancel();
    return super.close();
  }

  /// `GET /orders/{id}` cukup untuk seluruh layar — sudah membawa
  /// `sub_orders[]` + `items[]` + `shipments[]`.
  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _orders.detail(orderId);
    if (isClosed) return;

    switch (result) {
      case DataSuccess<OrderModel>(:final data):
        emit(state.copyWith(isLoading: false, order: data));
        // Pembayaran hanya relevan kalau tagihannya sudah terbit.
        if (data.canPay) {
          await refreshPayment();
          await refreshWalletBalance();
        }
      case DataFailed(:final error):
        emit(state.copyWith(isLoading: false, error: error));
      default:
        emit(state.copyWith(isLoading: false));
    }
  }

  /// Membaca pembayaran yang ada, kalau ada.
  ///
  /// 404 di sini **normal**: order yang belum pernah dibuatkan tagihan tidak
  /// punya pembayaran, dan itu bukan error yang perlu ditampilkan.
  Future<void> refreshPayment() async {
    final result = await _payments.detail(orderId: orderId);
    if (isClosed) return;

    if (result case DataSuccess<PaymentModel>(:final data)) {
      emit(state.copyWith(payment: data));
      _schedulePolling(data);
    }
  }

  /// Saldo dompet, untuk menyebut angkanya di tombol "Bayar dengan Saldo".
  ///
  /// Kegagalannya sengaja **tidak** ditampilkan sebagai error layar: saldo
  /// cuma pelengkap tampilan, dan order tetap bisa dibayar dengan cara lain.
  Future<void> refreshWalletBalance() async {
    final result = await _wallet.balance();
    if (isClosed) return;

    if (result case DataSuccess<WalletBalanceModel>(:final data)) {
      emit(state.copyWith(walletBalance: data.balance));
    }
  }

  /// `POST /payments/initiate`.
  ///
  /// Kalau sudah ada pembayaran pending, server mengembalikan **yang lama
  /// dengan HTTP 200** (bukan 201) — jadi memanggil ini dua kali tidak
  /// membuat tagihan ganda, dan [DataSuccess.isExisting] menandainya.
  Future<void> initiatePayment(PaymentMethod method) async {
    if (state.isInitiatingPayment) return;
    emit(state.copyWith(isInitiatingPayment: true, error: null));

    final result = await _payments.initiate(orderId: orderId, method: method);
    if (isClosed) return;

    switch (result) {
      case DataSuccess<PaymentModel>(:final data, :final isExisting):
        emit(state.copyWith(
          isInitiatingPayment: false,
          payment: data,
          message: isExisting
              ? 'Tagihan yang sudah ada ditampilkan kembali'
              : null,
        ));
        _schedulePolling(data);
      case DataFailed(:final error):
        emit(state.copyWith(isInitiatingPayment: false, error: error));
        // Server baru saja menyebut saldo sebenarnya di `details.balance`.
        // Dipakai supaya angka di layar langsung benar, tanpa panggilan
        // tambahan.
        if (error.code == ApiErrorCode.insufficientBalance &&
            error.walletBalance != null) {
          emit(state.copyWith(walletBalance: error.walletBalance));
        }
      default:
        emit(state.copyWith(isInitiatingPayment: false));
    }
  }

  /// Polling status pembayaran.
  ///
  /// Tidak ada webhook ke aplikasi dan **tidak ada endpoint notifikasi sama
  /// sekali**, jadi menanya ulang adalah satu-satunya cara tahu pembayaran
  /// sudah masuk. Interval 10 detik dan berhenti sendiri begitu statusnya
  /// final, supaya tidak memukul server tanpa guna.
  void _schedulePolling(PaymentModel payment) {
    _poll?.cancel();
    if (!payment.shouldPoll) return;

    _poll = Timer.periodic(const Duration(seconds: 10), (_) async {
      final result = await _payments.detail(orderId: orderId);
      if (isClosed) return;
      if (result case DataSuccess<PaymentModel>(:final data)) {
        emit(state.copyWith(payment: data));
        if (!data.shouldPoll) {
          _poll?.cancel();
          // Status pembayaran berubah berarti status order juga berubah.
          await load();
        }
      }
    });
  }

  /// Tombol **"Pesanan Diterima"** — level pengiriman, bukan order.
  Future<void> completeShipment(int shipmentId) async {
    if (state.busyShipmentIds.contains(shipmentId)) return;
    emit(state.copyWith(
      busyShipmentIds: {...state.busyShipmentIds, shipmentId},
      error: null,
    ));

    final result = await _orders.completeShipment(shipmentId);
    if (isClosed) return;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(
        busyShipmentIds: {...state.busyShipmentIds}..remove(shipmentId),
        error: error,
      ));
      return;
    }

    await load();
    if (isClosed) return;
    emit(state.copyWith(
      busyShipmentIds: {...state.busyShipmentIds}..remove(shipmentId),
      message: 'Terima kasih, pesanan ditandai diterima',
    ));
  }

  /// Pembatalan hanya sah sebelum toko memproses. Setelah itu butuh
  /// persetujuan toko dan **belum ada endpoint member untuk itu**.
  Future<void> cancel() async {
    if (state.isCancelling) return;
    emit(state.copyWith(isCancelling: true, error: null));

    final result = await _orders.cancel(orderId);
    if (isClosed) return;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(isCancelling: false, error: error));
      return;
    }

    await load();
    if (isClosed) return;
    emit(state.copyWith(isCancelling: false, message: 'Pesanan dibatalkan'));
  }

  void clearMessage() => emit(state.copyWith(message: null, error: null));
}
