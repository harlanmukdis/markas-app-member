import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'order_models.freezed.dart';
part 'order_models.g.dart';

/// Satu baris barang di sub-order.
///
/// Semua field bersufiks `_snapshot` adalah nilai yang **dibekukan saat
/// checkout**. Itu yang mengikat: kalau toko mengubah harga besok, order ini
/// tetap memakai `unit_price_snapshot`. Jangan pernah menampilkan harga
/// terbaru dari `/offers` di halaman pesanan.
@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();

  const factory OrderItemModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
    @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
    @StringOrNullJson() @JsonKey(name: 'item_name_snapshot') String? itemName,

    /// **Selalu berisi `"unit"`** di backend saat ini: resolusi satuan jual
    /// belum jalan di checkout. Untuk menampilkan satuan asli (sak/dus/m²),
    /// ambil dari `GET /sku-master/{id}` → `units[]`.
    @StringOrNullJson() @JsonKey(name: 'unit_name_snapshot') String? unitName,

    @DoubleJson() @Default(0) double qty,
    @IntJson() @JsonKey(name: 'unit_price_snapshot') @Default(0)
    int unitPrice,
    @IntJson() @JsonKey(name: 'line_subtotal') @Default(0) int lineSubtotal,
    @DoubleOrNullJson() @JsonKey(name: 'weight_kg_snapshot') double? weightKg,
    @StringOrNullJson() @JsonKey(name: 'handling_class_snapshot')
    String? handlingClass,
    @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  bool get isFragile => handlingClass == 'PECAH_BELAH';

  /// `unit_name_snapshot` masih placeholder di backend.
  bool get hasRealUnitName => unitName != null && unitName != 'unit';
}

/// Pengiriman — **satuan fisik**.
///
/// Di sinilah tombol "Pesanan Diterima" berada, dan retur diajukan terhadap
/// `id` ini, bukan terhadap order.
@freezed
abstract class ShipmentModel with _$ShipmentModel {
  const ShipmentModel._();

  const factory ShipmentModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'shipment_no') String? shipmentNo,
    @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
    @StringJson() @Default('') String status,
    @StringOrNullJson() @JsonKey(name: 'shipping_method') String? shippingMethod,
    @StringOrNullJson() @JsonKey(name: 'fleet_type_code') String? fleetTypeCode,
    @IntJson() @JsonKey(name: 'shipping_cost') @Default(0) int shippingCost,
    @StringOrNullJson() @JsonKey(name: 'surat_jalan_no') String? suratJalanNo,
    @ServerDateTimeJson() @JsonKey(name: 'surat_jalan_issued_at')
    DateTime? suratJalanIssuedAt,

    // --- Bukti terima (POD) — layak ditampilkan ke pembeli ---
    @StringOrNullJson() @JsonKey(name: 'pod_photo_url') String? podPhotoUrl,
    @StringOrNullJson() @JsonKey(name: 'pod_receiver_name')
    String? podReceiverName,
    @StringOrNullJson() @JsonKey(name: 'pod_signature_url')
    String? podSignatureUrl,
    @ServerDateTimeJson() @JsonKey(name: 'pod_uploaded_at')
    DateTime? podUploadedAt,

    @IntJson() @JsonKey(name: 'delivery_attempt_count') @Default(0)
    int deliveryAttemptCount,
    @StringOrNullJson() @JsonKey(name: 'handling_class_snapshot')
    String? handlingClass,

    /// Titik mulai jendela retur **dan** hitungan auto-complete H+3.
    @ServerDateTimeJson() @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @ServerDateTimeJson() @JsonKey(name: 'completed_at') DateTime? completedAt,

    /// Kapan dana cair ke toko — informasional bagi pembeli.
    @ServerDateTimeJson() @JsonKey(name: 'hold_release_at')
    DateTime? holdReleaseAt,
  }) = _ShipmentModel;

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);

  /// Tombol "Pesanan Diterima" hanya sah dari status `SAMPAI`.
  bool get canComplete => status == 'SAMPAI';

  bool get isDelivered => deliveredAt != null;
  bool get hasPod => podPhotoUrl != null || podReceiverName != null;
  bool get isFragile => handlingClass == 'PECAH_BELAH';

  /// Jendela retur: **2×24 jam** untuk pecah belah, **7 hari** untuk lainnya,
  /// dihitung dari [deliveredAt].
  Duration get returnWindow =>
      isFragile ? const Duration(hours: 48) : const Duration(days: 7);

  /// Batas akhir pengajuan retur, `null` kalau barang belum sampai.
  ///
  /// Dihitung dari `delivered_at` yang dikirim server. Perhatikan bug jam 5
  /// jam di backend v2.2 masih berlaku untuk nilai ini juga — tampilkan
  /// sebagai waktu absolut, jangan hitung mundur presisi.
  DateTime? get returnDeadline => deliveredAt?.add(returnWindow);
}

/// Sub-order — bagian milik **satu toko**.
@freezed
abstract class SubOrderModel with _$SubOrderModel {
  const SubOrderModel._();

  const factory SubOrderModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'sub_order_no') String? subOrderNo,
    @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
    @IntJson() @JsonKey(name: 'seller_id') required int sellerId,
    @StringJson() @Default('') String status,

    /// Batas toko mengonfirmasi (1×24 jam kerja). Lewat itu order auto-batal
    /// dan pembeli direfund penuh.
    @ServerDateTimeJson() @JsonKey(name: 'seller_confirm_deadline')
    DateTime? sellerConfirmDeadline,

    @IntJson() @Default(0) int subtotal,
    @IntJson() @JsonKey(name: 'shipping_total') @Default(0) int shippingTotal,
    @IntJson() @JsonKey(name: 'discount_seller') @Default(0)
    int discountSeller,
    @IntJson() @JsonKey(name: 'discount_platform') @Default(0)
    int discountPlatform,
    @IntJson() @JsonKey(name: 'tax_total') @Default(0) int taxTotal,
    @IntJson() @Default(0) int total,

    @StringOrNullJson() @JsonKey(name: 'seller_pkp_status_snapshot')
    String? sellerPkpStatus,
    @StringOrNullJson() @JsonKey(name: 'cancel_reason') String? cancelReason,

    /// Barang custom **tidak bisa dibatalkan** setelah diproses (ORD-11) —
    /// wajib diberitahukan sebelum pembeli membayar, bukan di S&K.
    @BoolJson() @JsonKey(name: 'has_custom_item') @Default(false)
    bool hasCustomItem,

    @Default(<OrderItemModel>[]) List<OrderItemModel> items,
    @Default(<ShipmentModel>[]) List<ShipmentModel> shipments,
  }) = _SubOrderModel;

  factory SubOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SubOrderModelFromJson(json);

  bool get isPkp => sellerPkpStatus == 'PKP';
  bool get isCancelled => status.startsWith('BATAL');

  /// Pengiriman yang menunggu konfirmasi terima dari pembeli.
  List<ShipmentModel> get awaitingConfirmation =>
      shipments.where((s) => s.canComplete).toList();
}

/// Order induk — **satuan pembayaran**. Pembeli bayar sekali walau belanja di
/// beberapa toko.
@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
    @StringJson() @Default('') String status,
    @StringOrNullJson() @JsonKey(name: 'buyer_segment_snapshot')
    String? buyerSegmentSnapshot,
    @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,

    @BoolJson() @JsonKey(name: 'all_or_nothing') @Default(false)
    bool allOrNothing,

    // Semua nominal rupiah penuh, sudah dibulatkan server. Aplikasi hanya
    // memformat — tidak pernah menjumlahkan (aturan §10.4 spec).
    @IntJson() @Default(0) int subtotal,
    @IntJson() @JsonKey(name: 'discount_total') @Default(0) int discountTotal,
    @IntJson() @JsonKey(name: 'shipping_total') @Default(0) int shippingTotal,
    @IntJson() @JsonKey(name: 'tax_total') @Default(0) int taxTotal,
    @IntJson() @JsonKey(name: 'service_fee') @Default(0) int serviceFee,
    @IntJson() @JsonKey(name: 'grand_total') @Default(0) int grandTotal,

    /// Batas toko mengonfirmasi ketersediaan, untuk order di atas ambang.
    @ServerDateTimeJson() @JsonKey(name: 'stock_confirm_deadline')
    DateTime? stockConfirmDeadline,

    /// Batas bayar. **Nilai ini terkena bug jam 5 jam di backend v2.2** —
    /// tampilkan absolut, jangan hitung mundur presisi.
    @ServerDateTimeJson() @JsonKey(name: 'payment_deadline')
    DateTime? paymentDeadline,

    /// Order di atas ambang: metode **dipaksa** transfer bank. Sembunyikan
    /// opsi VA/QRIS/e-wallet/kartu.
    @BoolJson() @JsonKey(name: 'forced_bank_transfer') @Default(false)
    bool forcedBankTransfer,

    @IntOrNullJson() @JsonKey(name: 'rfq_contract_id') int? rfqContractId,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,

    @Default(<SubOrderModel>[]) List<SubOrderModel> subOrders,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// Tagihan sudah terbit dan tombol bayar boleh muncul.
  bool get canPay => status == 'MENUNGGU_BAYAR';

  /// **Tagihan BELUM terbit.** Toko harus mengonfirmasi ketersediaan dulu
  /// (1×24 jam kerja) — jangan tampilkan tombol bayar.
  bool get awaitingStockConfirmation => status == 'MENUNGGU_KONFIRMASI_STOK';

  /// Pembatalan oleh pembeli hanya sah sebelum toko memproses.
  bool get canCancel => canPay || awaitingStockConfirmation;

  bool get isFinished => status == 'SELESAI';
  bool get isCancelled =>
      status == 'DIBATALKAN' || status == 'KEDALUWARSA' ||
      status == 'DIHENTIKAN';

  List<ShipmentModel> get allShipments =>
      subOrders.expand((s) => s.shipments).toList();

  /// Pengiriman yang menunggu tombol "Pesanan Diterima".
  List<ShipmentModel> get shipmentsAwaitingConfirmation =>
      allShipments.where((s) => s.canComplete).toList();

  /// Ada barang custom di salah satu sub-order — pembatalan setelah diproses
  /// tidak dimungkinkan.
  bool get hasCustomItem => subOrders.any((s) => s.hasCustomItem);
}

/// Hasil `POST /checkout`.
@freezed
abstract class CheckoutResultModel with _$CheckoutResultModel {
  const CheckoutResultModel._();

  const factory CheckoutResultModel({
    @IntJson() @JsonKey(name: 'order_id') required int orderId,
    @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
    @StringJson() @Default('') String status,
    @IntJson() @JsonKey(name: 'grand_total') @Default(0) int grandTotal,
    @BoolJson() @JsonKey(name: 'forced_bank_transfer') @Default(false)
    bool forcedBankTransfer,
    @JsonKey(name: 'sub_order_ids') @Default(<int>[]) List<int> subOrderIds,
  }) = _CheckoutResultModel;

  factory CheckoutResultModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResultModelFromJson(json);

  /// Langsung boleh ke layar pembayaran.
  bool get canPayNow => status == 'MENUNGGU_BAYAR';

  /// Tagihan belum terbit — tampilkan status menunggu konfirmasi toko,
  /// **bukan** tombol bayar.
  bool get awaitingStockConfirmation => status == 'MENUNGGU_KONFIRMASI_STOK';
}
