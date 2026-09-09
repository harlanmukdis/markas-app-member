import 'package:flutter/material.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/core/widgets/custom_text_form_field.dart';
import 'package:navy_wear/ui/main/checkout/cubit/checkout_cubit.dart';

/// Form tambah alamat.
///
/// **Tidak ada pemilih "akses lokasi"** di sini, dan itu disengaja: kolom
/// `m_addresses.access_type` memang dipakai backend untuk memblokir armada
/// besar, tapi endpoint alamat **tidak menerima maupun menyimpannya** —
/// nilainya selalu `NULL`. Menyediakan pemilihnya berarti membiarkan user
/// mengisi sesuatu yang dibuang diam-diam.
///
/// Koordinat diisi manual untuk sekarang. Pemilih peta butuh Google Maps yang
/// di repo ini masih dikomentari beserta API key-nya, jadi menyediakannya
/// setengah jalan hanya akan menyesatkan.
Future<void> showAddressFormSheet(
  BuildContext context,
  CheckoutCubit cubit,
) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: isAppDarkMode() ? kDarkColor : kWhiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => _AddressForm(cubit: cubit),
  );
}

class _AddressForm extends StatefulWidget {
  const _AddressForm({required this.cubit});

  final CheckoutCubit cubit;

  @override
  State<_AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<_AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _label = TextEditingController();
  final _recipient = TextEditingController();
  final _phone = TextEditingController();
  final _province = TextEditingController();
  final _city = TextEditingController();
  final _district = TextEditingController();
  final _address = TextEditingController();
  final _lat = TextEditingController();
  final _lng = TextEditingController();
  bool _isDefault = false;
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [
      _label,
      _recipient,
      _phone,
      _province,
      _city,
      _district,
      _address,
      _lat,
      _lng,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _saving = true);
    final ok = await widget.cubit.createAddress(
      recipientName: _recipient.text.trim(),
      phone: _phone.text.trim(),
      province: _province.text.trim(),
      city: _city.text.trim(),
      fullAddress: _address.text.trim(),
      lat: double.parse(_lat.text.trim().replaceAll(',', '.')),
      lng: double.parse(_lng.text.trim().replaceAll(',', '.')),
      label: _label.text.trim().isEmpty ? null : _label.text.trim(),
      district: _district.text.trim().isEmpty ? null : _district.text.trim(),
      isDefault: _isDefault,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (ok) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        padding: 20.pa,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alamat baru', style: AppStyles.styleSemiBold18(context)),
              16.sbh,
              _field(_label, 'Label (opsional)', hint: 'Rumah, Proyek A'),
              _field(_recipient, 'Nama penerima', required: true),
              _field(
                _phone,
                'Nomor HP penerima',
                required: true,
                keyboard: TextInputType.phone,
              ),
              _field(_province, 'Provinsi', required: true),
              _field(_city, 'Kota/Kabupaten', required: true),
              _field(_district, 'Kecamatan (opsional)'),
              _field(_address, 'Alamat lengkap', required: true, lines: 2),
              12.sbh,
              Container(
                padding: 10.pa,
                decoration: BoxDecoration(
                  color: kWarningColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Koordinat wajib diisi — server memakainya untuk menentukan '
                  'zona ongkir. Ambil dari Google Maps: tekan lama titik '
                  'lokasi, lalu salin angkanya.',
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: kWarningColor),
                ),
              ),
              12.sbh,
              Row(
                children: [
                  Expanded(
                    child: _field(
                      _lat,
                      'Latitude',
                      required: true,
                      keyboard: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      validator: _coordinateValidator(-90, 90),
                    ),
                  ),
                  12.sbw,
                  Expanded(
                    child: _field(
                      _lng,
                      'Longitude',
                      required: true,
                      keyboard: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      validator: _coordinateValidator(-180, 180),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isDefault,
                    onChanged: (v) => setState(() => _isDefault = v ?? false),
                  ),
                  Expanded(
                    child: Text(
                      'Jadikan alamat utama',
                      style: AppStyles.styleRegular14(context),
                    ),
                  ),
                ],
              ),
              16.sbh,
              CustomButton(
                onPressed: _saving ? null : _submit,
                child: _saving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Simpan Alamat',
                        style: AppStyles.styleSemiBold14(context)
                            .copyWith(color: Colors.white),
                      ),
              ),
              16.sbh,
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool required = false,
    String? hint,
    int lines = 1,
    TextInputType? keyboard,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppStyles.styleMedium12(context)),
          6.sbh,
          CustomTextFormField(
            controller: controller,
            hintText: hint ?? label,
            maxLines: lines,
            keyboardType: keyboard,
            validator: validator ??
                (required
                    ? (v) => (v == null || v.trim().isEmpty)
                        ? '$label wajib diisi'
                        : null
                    : null),
          ),
        ],
      ),
    );
  }

  String? Function(String?) _coordinateValidator(double min, double max) {
    return (value) {
      final raw = value?.trim().replaceAll(',', '.') ?? '';
      if (raw.isEmpty) return 'Wajib diisi';
      final parsed = double.tryParse(raw);
      if (parsed == null) return 'Harus angka';
      if (parsed < min || parsed > max) return 'Di luar rentang';
      return null;
    };
  }
}
