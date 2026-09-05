import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:navy_wear/util/format_helper.dart';

void main() {
  group('parseServerInstant — timestamp server tanpa timezone', () {
    test('14:00 WIB dibaca sebagai 07:00 UTC, bukan 14:00 lokal', () {
      // Inti masalahnya: DateTime.parse("2026-09-06 14:00:00") menghasilkan
      // waktu LOKAL perangkat. Di emulator/CI yang ber-timezone UTC, countdown
      // batas bayar akan melenceng 7 jam kalau ini salah.
      final instant = parseServerInstant('2026-09-06 14:00:00');
      expect(instant, isNotNull);
      expect(instant!.toUtc(), DateTime.utc(2026, 9, 6, 7, 0, 0));
    });

    test('round-trip lewat formatForServer tidak menggeser jam', () {
      const raw = '2026-09-06 14:00:00';
      expect(formatForServer(parseServerInstant(raw)), raw);
    });

    test('nilai kosong dan zero-date MySQL jadi null, tidak melempar', () {
      expect(parseServerInstant(null), isNull);
      expect(parseServerInstant(''), isNull);
      expect(parseServerInstant('0000-00-00 00:00:00'), isNull);
      expect(parseServerInstant('bukan tanggal'), isNull);
    });
  });

  group('hitung mundur deadline', () {
    test('deadline lewat terdeteksi dan diberi label jelas', () {
      final lewat = DateTime.now().toUtc().subtract(const Duration(hours: 1));
      expect(isPast(lewat), isTrue);
      expect(formatCountdown(remainingUntil(lewat)), 'Waktu habis');
    });

    test('format ringkas per rentang', () {
      expect(formatCountdown(const Duration(days: 2, hours: 3)), '2 hari 3 jam');
      expect(formatCountdown(const Duration(hours: 5, minutes: 12)),
          '5 jam 12 menit');
      expect(formatCountdown(const Duration(minutes: 8)), '8 menit');
      expect(formatCountdown(const Duration(seconds: 30)),
          'kurang dari 1 menit');
      expect(formatCountdown(null), '-');
    });
  });

  group('formatRupiah', () {
    test('rupiah penuh tanpa sen, pemisah ribuan titik', () {
      expect(formatRupiah(6500000), 'Rp 6.500.000');
      expect(formatRupiah(0), 'Rp 0');
    });

    test('null memakai fallback, bukan "Rp null"', () {
      expect(formatRupiah(null), '-');
      expect(formatRupiah(null, fallback: 'Gratis'), 'Gratis');
    });
  });

  group('tampilan tanggal', () {
    test('ditampilkan dalam WIB dengan penanda, bukan waktu perangkat', () {
      final instant = parseServerInstant('2026-09-06 14:30:00');
      expect(formatServerDateTime(instant), contains('14:30'));
      expect(formatServerDateTime(instant), contains('WIB'));
      expect(formatServerDateTime(null), '-');
    });
  });

  group('locale aktif tidak boleh mencemari format wire', () {
    tearDown(() => Intl.defaultLocale = null);

    test('locale ar tetap menghasilkan angka ASCII untuk server', () {
      // CachedHelper.init() menyetel Intl.defaultLocale sesuai bahasa pilihan
      // user. Tanpa locale wire yang dipatok, DateFormat pada locale `ar`
      // memakai angka Arab-Indic dan backend menolak tanggalnya.
      Intl.defaultLocale = 'ar';
      final instant = parseServerInstant('2026-09-06 14:00:00');

      expect(formatForServer(instant), '2026-09-06 14:00:00');
      expect(formatDateForServer(instant), '2026-09-06');
      expect(formatForServer(instant), matches(r'^[0-9:\- ]+$'));
    });

    test('tampilan ke user tetap bisa dirender di locale apa pun', () {
      Intl.defaultLocale = 'ar';
      final instant = parseServerInstant('2026-09-06 14:30:00');
      expect(formatServerDateTime(instant), contains('WIB'));
    });
  });
}
