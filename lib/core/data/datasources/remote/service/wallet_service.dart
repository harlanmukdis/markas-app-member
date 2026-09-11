import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';

/// Dompet / saldo Markas.
///
/// > **`POST /wallet/topup_verify_mock` sengaja TIDAK dibuatkan method.**
/// > Endpoint itu menandai top-up sebagai terverifikasi tanpa uang sungguhan
/// > berpindah — alat bantu test backend, bukan bagian alur pembeli. Kalau
/// > dipanggil dari aplikasi, saldo bisa ditambah sendiri oleh siapa pun yang
/// > memegang token.
class WalletService {
  WalletService(this._dio);

  final Dio _dio;

  /// `GET /wallet`.
  Future<ApiEnvelope<WalletBalanceModel>> balance() async {
    const context = 'GET /wallet';
    try {
      final response = await _dio.get<dynamic>('/wallet');
      return parseEnvelope(
        response,
        (raw) => WalletBalanceModel.fromJson(
            Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /wallet/topup`.
  ///
  /// [method] tidak menerima `BANK_TRANSFER` — berbeda dari pembayaran order.
  Future<ApiEnvelope<WalletTopupModel>> topup({
    required TopupMethod method,
    required int amount,
  }) async {
    const context = 'POST /wallet/topup';
    try {
      final response = await _dio.post<dynamic>(
        '/wallet/topup',
        data: {'method': method.wireValue, 'amount': amount},
      );
      return parseEnvelope(
        response,
        (raw) =>
            WalletTopupModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /wallet/history`.
  Future<ApiEnvelope<List<WalletEntryModel>>> history({
    int limit = 30,
    int offset = 0,
  }) async {
    const context = 'GET /wallet/history';
    try {
      final response = await _dio.get<dynamic>(
        '/wallet/history',
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return parseEnvelopeList(
        response,
        (json) => WalletEntryModel.fromJson(json),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
