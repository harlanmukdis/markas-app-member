import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/util/json_converters.dart';

void main() {
  group('asInt — field numerik datang sebagai string ATAU number', () {
    test('menerima kedua bentuk grand_total yang dikirim backend', () {
      // POST /checkout mengirim number, GET /orders/{id} mengirim string.
      expect(asInt(6500000), 6500000);
      expect(asInt('6500000'), 6500000);
    });

    test('menerima DECIMAL bertitik dari MySQL', () {
      expect(asInt('6500000.00'), 6500000);
      expect(asInt('63000.50'), 63001); // dibulatkan
    });

    test('null / kosong / sampah jatuh ke fallback, tidak melempar', () {
      expect(asInt(null), 0);
      expect(asInt(''), 0);
      expect(asInt('  '), 0);
      expect(asInt('bukan angka'), 0);
      expect(asInt(null, fallback: -1), -1);
      expect(asIntOrNull('bukan angka'), isNull);
    });
  });

  group('asBool — tinyint MySQL sampai sebagai "0"/"1"', () {
    test('string "0" adalah false, bukan truthy', () {
      // Ini jebakannya: `if ("0")` bernilai true di banyak bahasa, dan
      // forced_bank_transfer dikirim sebagai "0" oleh GET /orders/{id}.
      expect(asBool('0'), isFalse);
      expect(asBool('1'), isTrue);
    });

    test('menerima bool asli dan number', () {
      expect(asBool(false), isFalse);
      expect(asBool(true), isTrue);
      expect(asBool(0), isFalse);
      expect(asBool(1), isTrue);
    });

    test('varian teks dan nilai tak dikenal', () {
      expect(asBool('true'), isTrue);
      expect(asBool('FALSE'), isFalse);
      expect(asBool(''), isFalse);
      expect(asBoolOrNull('mungkin'), isNull);
    });
  });

  group('converter yang dipakai sebagai anotasi model', () {
    test('IntJson dan BoolJson memakai aturan yang sama', () {
      expect(const IntJson().fromJson('6500000'), 6500000);
      expect(const BoolJson().fromJson('0'), isFalse);
      expect(const IntOrNullJson().fromJson(null), isNull);
    });
  });
}
