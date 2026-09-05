import 'dart:async';

/// Kanal siaran untuk kejadian sesi yang terjadi **di luar** alur UI.
///
/// Interceptor bekerja jauh dari widget tree: ketika refresh token ditolak, ia
/// tidak punya `BuildContext` untuk menendang user ke halaman login. Jadi ia
/// menyiarkan lewat sini, dan shell app berlangganan lalu memutuskan navigasi.
///
/// Broadcast (bukan single-subscription) supaya router dan indikator sesi bisa
/// mendengarkan bersamaan tanpa saling mencuri event.
class AuthEvents {
  final StreamController<void> _forceLogout =
      StreamController<void>.broadcast();

  /// Sesi benar-benar habis dan tidak bisa dipulihkan — refresh token invalid
  /// atau sudah dicabut. Pendengar harus membersihkan state dan mengarahkan ke
  /// login.
  Stream<void> get onForceLogout => _forceLogout.stream;

  void emitForceLogout() {
    if (!_forceLogout.isClosed) _forceLogout.add(null);
  }

  Future<void> dispose() => _forceLogout.close();
}
