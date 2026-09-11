import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/di/injector.dart';

part 'wallet_cubit.freezed.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit()
      : _wallet = injector<WalletRepository>(),
        super(const WalletState());

  static WalletCubit get(BuildContext context) => BlocProvider.of(context);

  final WalletRepository _wallet;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));
    await Future.wait([_loadBalance(), _loadHistory()]);
    if (isClosed) return;
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _loadBalance() async {
    final result = await _wallet.balance();
    if (isClosed) return;
    switch (result) {
      case DataSuccess<WalletBalanceModel>(:final data):
        emit(state.copyWith(balance: data.balance));
      case DataFailed(:final error):
        emit(state.copyWith(error: error));
      default:
        break;
    }
  }

  /// Riwayat kosong itu wajar untuk akun baru — `DataEmpty` bukan error.
  Future<void> _loadHistory() async {
    final result = await _wallet.history(limit: 50);
    if (isClosed) return;
    if (result case DataSuccess<List<WalletEntryModel>>(:final data)) {
      emit(state.copyWith(entries: data));
    } else if (result is DataEmpty) {
      emit(state.copyWith(entries: const []));
    }
  }

  /// `POST /wallet/topup`.
  ///
  /// Top-up **tidak langsung menambah saldo**: server membalas status
  /// `TERTUNDA` dengan VA/QRIS yang harus dibayar dulu. Karena gateway-nya
  /// masih `MOCK_GATEWAY`, nomornya palsu dan saldo tidak akan pernah masuk
  /// sendiri — itu yang wajib dikatakan ke pembeli, bukan "berhasil".
  Future<void> topup({
    required TopupMethod method,
    required int amount,
  }) async {
    if (state.isSubmitting) return;
    emit(state.copyWith(isSubmitting: true, error: null, lastTopup: null));

    final result = await _wallet.topup(method: method, amount: amount);
    if (isClosed) return;

    switch (result) {
      case DataSuccess<WalletTopupModel>(:final data):
        emit(state.copyWith(isSubmitting: false, lastTopup: data));
        await _loadHistory();
      case DataFailed(:final error):
        emit(state.copyWith(isSubmitting: false, error: error));
      default:
        emit(state.copyWith(isSubmitting: false));
    }
  }

  void dismissTopup() => emit(state.copyWith(lastTopup: null));
}
