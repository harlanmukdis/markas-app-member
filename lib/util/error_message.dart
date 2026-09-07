import 'package:flutter/widgets.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/generated/l10n.dart';

/// Menerjemahkan [DataError] jadi pesan yang layak dibaca user.
///
/// `error.message` dari backend **tidak dipakai langsung**: isinya teks teknis
/// berbahasa Inggris yang ditujukan untuk developer (`"Missing required
/// fields"`). Yang dipetakan adalah `error.code`, yang stabil dan bisa
/// dilokalisasi.
///
/// Kode yang belum dipetakan jatuh ke pesan generik — **bukan** ke
/// `error.message` — supaya tidak ada teks internal yang bocor ke layar.
/// Setiap domain fitur menambahkan kodenya sendiri di sini saat diintegrasikan
/// (mis. `BELOW_MIN_ORDER`, `STOCK_RESERVATION_FAILED`, `RETURN_WINDOW_EXPIRED`).
String errorMessageFor(BuildContext context, DataError error) {
  final l = S.of(context);

  switch (error.code) {
    // --- transport ---
    case ClientErrorCode.network:
      return l.noInternetConnection;
    case ClientErrorCode.timeout:
      return l.requestTimedOut;

    // --- auth ---
    case ApiErrorCode.invalidCredentials:
      return l.invalidCredentialsMessage;
    case ApiErrorCode.accountSuspended:
      return l.accountSuspendedMessage;

    // Ditangani bersama FORBIDDEN: bagi user, "role tidak berhak" dan
    // "izin grup tidak mengizinkan" adalah hal yang sama.
    case ApiErrorCode.forbidden:
    case ApiErrorCode.permissionDenied:
      return l.notAvailable;
    case ApiErrorCode.unauthenticated:
    case ApiErrorCode.invalidRefreshToken:
    case ApiErrorCode.refreshRevoked:
      return l.sessionExpired;

    // Bukan konstanta di ApiErrorCode karena hanya dipakai endpoint register.
    case 'PHONE_TAKEN':
      return l.phoneAlreadyRegistered;
    case 'EMAIL_TAKEN':
      return l.emailAlreadyRegistered;
  }

  return l.somethingWentWrong;
}

/// Detail teknis untuk log dan laporan bug — **jangan** ditampilkan ke user.
///
/// Menyertakan `details.missing` kalau ada, karena itu yang paling cepat
/// menunjukkan field mana yang belum dikirim saat `422 VALIDATION_ERROR`.
String debugDetailFor(DataError error) {
  final missing = error.missingFields;
  return [
    error.code,
    if (error.statusCode != null) 'HTTP ${error.statusCode}',
    error.message,
    if (missing.isNotEmpty) 'missing: ${missing.join(', ')}',
  ].join(' | ');
}
