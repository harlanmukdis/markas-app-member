# Asset di folder ini adalah PLACEHOLDER, bukan asset asli

UI kit yang dibeli tidak menyertakan `assets/images/`, `assets/icon/`, dan
`assets/fonts/` ke repo ini, sehingga `flutter build` gagal total — bukan di
kode, tapi di tahap bundling asset. Supaya app bisa dijalankan dan integrasi
API bisa dites, seluruh asset yang direferensikan kode diganti placeholder.

## Apa yang di-stub

- **67 file** di `assets/images/` dan `assets/icon/` — kotak abu-abu 64×64.
  - `.svg` berisi SVG asli (kotak + garis diagonal).
  - `.png` / `.jpg` / `.jpeg` semuanya berisi **byte PNG**. Ini bukan
    kekeliruan: Flutter mendeteksi format gambar dari magic bytes, bukan dari
    ekstensi berkas, jadi file bernama `.jpg` yang berisi PNG tetap ter-decode.
- **Deklarasi font `Hanimation` di `pubspec.yaml` dinonaktifkan** (dikomentari).
  Font tidak bisa di-placeholder — OTF palsu akan gagal di-parse dan membuat app
  crash saat start. Akibatnya seluruh teks memakai font sistem, jadi tipografi
  yang kamu lihat **bukan** tipografi desain aslinya.

## Cara mengembalikan ke asset asli

1. Copy `assets/images/`, `assets/icon/`, dan `assets/fonts/` dari sumber UI kit
   ke folder ini, **timpa** placeholder-nya.
2. Aktifkan kembali blok `fonts:` di `pubspec.yaml` (hapus tanda `#`).
3. Hapus berkas ini.
4. `flutter clean && flutter pub get`, lalu jalankan ulang.

Untuk memeriksa mana yang masih placeholder: semua file stub berukuran di bawah
1 KB dan identik satu sama lain per jenisnya.

## Yang TIDAK terpengaruh

Placeholder ini hanya menyentuh tampilan. Layout, navigasi, state, dan seluruh
lapisan API (`lib/config/network/`, `lib/core/`, `lib/di/`) tidak bergantung
pada isi asset — jadi hasil pengujian alur API tetap sahih.
