import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';

/// Checkout, pesanan, dan pengiriman.
///
/// > **`GET /shipments` (tanpa id) sengaja TIDAK dibuatkan method di sini.**
/// > Endpoint itu tidak disaring per pembeli dan mengembalikan pengiriman
/// > seluruh platform — termasuk nomor surat jalan, nama penerima POD, dan
/// > alamat orang lain. Masih terbuka di v2.2. Daftar pengiriman diambil dari
/// > [detail] (`GET /orders/{id}`), yang sudah ter-scope benar dan sekaligus
/// > membawa `sub_orders[]` + `items[]` + `shipments[]` dalam satu panggilan.
class OrderService {
  OrderService(this._dio);

  final Dio _dio;

  /// `POST /checkout`.
  ///
  /// Server melakukan semuanya dalam satu transaksi atomik: mengambil isi
  /// keranjang, mengelompokkan per toko, **menghitung ulang harga** dari tier
  /// yang berlaku, memeriksa minimum order, mereservasi stok, lalu membuat
  /// order induk + sub-order dan mengosongkan keranjang.
  ///
  /// [allOrNothing] (CRT-08): kalau satu sub-order batal, semuanya batal dan
  /// direfund penuh. Berguna untuk proyek yang materialnya harus lengkap —
  /// semen tanpa pasir tidak berguna.
  Future<ApiEnvelope<CheckoutResultModel>> checkout({
    required int addressId,
    bool? allOrNothing,
  }) async {
    const context = 'POST /checkout';
    try {
      final response = await _dio.post<dynamic>(
        '/checkout',
        data: {
          'address_id': addressId,
          if (allOrNothing != null) 'all_or_nothing': allOrNothing,
        },
      );
      return parseEnvelope(
        response,
        (raw) => CheckoutResultModel.fromJson(
            Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /orders` — **50 terbaru, tanpa paginasi**. Kalau user punya lebih
  /// banyak pesanan, sisanya tidak terjangkau sampai backend menambahkan
  /// `limit`/`offset`.
  Future<ApiEnvelope<List<OrderModel>>> list() async {
    const context = 'GET /orders';
    try {
      final response = await _dio.get<dynamic>('/orders');
      return parseEnvelopeList(response, OrderModel.fromJson,
          context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /orders/{id}` — **satu panggilan untuk seluruh layar detail**:
  /// order + `sub_orders[]` + `items[]` + `shipments[]`.
  Future<ApiEnvelope<OrderModel>> detail(int orderId) async {
    final context = 'GET /orders/$orderId';
    try {
      final response = await _dio.get<dynamic>('/orders/$orderId');
      return parseEnvelope(
        response,
        (raw) => OrderModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /orders/{id}/cancel` — hanya sah dari `MENUNGGU_BAYAR` atau
  /// `MENUNGGU_KONFIRMASI_STOK`. Setelah toko memproses, pembatalan butuh
  /// persetujuan toko (ORD-05) dan **belum ada endpoint member untuk itu**;
  /// arahkan user ke chat/CS.
  Future<ApiEnvelope<dynamic>> cancel(int orderId) async {
    final context = 'POST /orders/$orderId/cancel';
    try {
      final response = await _dio.post<dynamic>('/orders/$orderId/cancel');
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<SubOrderModel>> subOrder(int subOrderId) async {
    final context = 'GET /sub-orders/$subOrderId';
    try {
      final response = await _dio.get<dynamic>('/sub-orders/$subOrderId');
      return parseEnvelope(
        response,
        (raw) => SubOrderModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /shipments/{id}` — aman, kepemilikannya diperiksa server.
  Future<ApiEnvelope<ShipmentModel>> shipment(int shipmentId) async {
    final context = 'GET /shipments/$shipmentId';
    try {
      final response = await _dio.get<dynamic>('/shipments/$shipmentId');
      return parseEnvelope(
        response,
        (raw) => ShipmentModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /shipments/{id}/complete` — tombol **"Pesanan Diterima"**.
  ///
  /// Ada di level **pengiriman**, bukan order: satu pesanan bisa punya
  /// beberapa pengiriman dengan status berbeda. Hanya sah dari status
  /// `SAMPAI`. Kalau pembeli diam 3 hari, sistem menyelesaikannya sendiri
  /// (TO-05) — tapi cron belum terjadwal di server, jadi jangan mengandalkan
  /// transisi otomatis itu saat pengujian.
  Future<ApiEnvelope<dynamic>> completeShipment(int shipmentId) async {
    final context = 'POST /shipments/$shipmentId/complete';
    try {
      final response =
          await _dio.post<dynamic>('/shipments/$shipmentId/complete');
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
