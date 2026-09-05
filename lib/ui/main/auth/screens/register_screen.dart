import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/core/widgets/custom_text_form_field.dart';
import 'package:navy_wear/generated/l10n.dart';
import 'package:navy_wear/ui/main/auth/cubit/auth_cubit.dart';
import 'package:navy_wear/ui/main/auth/widgets/auth_error_banner.dart';
import 'package:navy_wear/ui/main/auth/widgets/auth_field_label.dart';

/// Layar pendaftaran.
///
/// Berbeda cukup jauh dari `register_view.dart` milik UI kit, karena API
/// mewajibkan hal yang tidak ada di form aslinya:
///
/// * `phone` (bukan email) adalah identitas utama — satu HP satu akun aktif.
/// * `role` **wajib** dipilih: `BUY_R` (retail) atau `BUY_B` (B2B/kontraktor).
/// * `BUY_B` **wajib** mengisi `npwp` dan `nib_siup_no`, kalau tidak server
///   membalas `422 VALIDATION_ERROR`.
///
/// Pilihan tipe akun ditampilkan sebagai pilihan sadar, bukan checkbox kecil,
/// karena konsekuensinya besar: hanya `BUY_B` yang melihat harga tier
/// `PROJECT` dan bisa mengajukan RFQ.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: const _RegisterBody(),
    );
  }
}

class _RegisterBody extends StatefulWidget {
  const _RegisterBody();

  @override
  State<_RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<_RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _npwp = TextEditingController();
  final _nibSiup = TextEditingController();

  bool _obscure = true;
  String _role = 'BUY_R';

  bool get _isBusiness => _role == 'BUY_B';

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _npwp.dispose();
    _nibSiup.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();

    AuthCubit.get(context).register(
      phone: _phone.text.trim(),
      password: _password.text,
      fullName: _fullName.text.trim(),
      role: _role,
      email: _email.text.trim(),
      // Dikirim hanya untuk B2B. Untuk retail server menolak nilai ini kalau
      // ikut terkirim tanpa alasan, dan field-nya juga tidak ditampilkan.
      npwp: _isBusiness ? _npwp.text.trim() : null,
      nibSiupNo: _isBusiness ? _nibSiup.text.trim() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          router.go(AppRoutes.homeLayout);
          return;
        }
        if (state is AuthRegisteredNeedsLogin) {
          // Akun sudah terbentuk, hanya login otomatisnya gagal. Mengarahkan
          // ke login — kalau user disuruh mendaftar lagi, dia akan kena
          // 409 PHONE_TAKEN dan menyangka pendaftarannya gagal.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.somethingWentWrong),
              backgroundColor: kWarningColor,
            ),
          );
          router.go(AppRoutes.login);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        final error = state is AuthUnauthenticated ? state.error : null;

        return Scaffold(
          appBar: customAppBar(context, l.register),
          body: SingleChildScrollView(
            padding: 24.psh,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.sbh,
                  Text(
                    l.registerTitle,
                    style: AppStyles.styleSemiBold24(context)
                        .copyWith(color: isAppDarkMode() ? null : kDarkColor),
                  ),
                  8.sbh,
                  Text(
                    l.registerSubtitle,
                    style: AppStyles.styleRegular14(context)
                        .copyWith(color: kLightThirdColor),
                  ),
                  24.sbh,

                  if (error != null) ...[
                    AuthErrorBanner(error: error, onRetry: _submit),
                    16.sbh,
                  ],

                  // --- tipe akun ---
                  AuthFieldLabel(l.accountType, isRequired: true),
                  8.sbh,
                  _RoleSelector(
                    role: _role,
                    enabled: !isLoading,
                    onChanged: (value) => setState(() => _role = value),
                  ),
                  if (_isBusiness) ...[
                    8.sbh,
                    Text(
                      l.businessBuyerNote,
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: kLightThirdColor),
                    ),
                  ],
                  16.sbh,

                  AuthFieldLabel(l.name, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _fullName,
                    readOnly: isLoading,
                    hintText: l.enterYourName,
                    keyboardType: TextInputType.name,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l.nameRequired : null,
                  ),
                  16.sbh,

                  AuthFieldLabel(l.phoneNumber, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _phone,
                    readOnly: isLoading,
                    hintText: l.enterYourPhoneNumber,
                    keyboardType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l.phoneRequired : null,
                  ),
                  16.sbh,

                  // Email opsional di API — ditandai supaya user tidak
                  // mengira wajib lalu menyerah di tengah form.
                  AuthFieldLabel(l.email),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _email,
                    readOnly: isLoading,
                    hintText: l.enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                  ),
                  16.sbh,

                  AuthFieldLabel(l.password, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _password,
                    readOnly: isLoading,
                    hintText: l.password,
                    obscureText: _obscure,
                    textDirection: TextDirection.ltr,
                    suffix: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l.passwordRequired;
                      if (v.length < 6) return l.passwordTooShort;
                      return null;
                    },
                  ),

                  // --- khusus B2B ---
                  if (_isBusiness) ...[
                    16.sbh,
                    AuthFieldLabel(l.npwpLabel, isRequired: true),
                    8.sbh,
                    CustomTextFormField(
                      filled: true,
                      controller: _npwp,
                      readOnly: isLoading,
                      hintText: l.enterYourNpwp,
                      textDirection: TextDirection.ltr,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? l.npwpRequiredForBusiness
                          : null,
                    ),
                    16.sbh,
                    AuthFieldLabel(l.nibSiupLabel, isRequired: true),
                    8.sbh,
                    CustomTextFormField(
                      filled: true,
                      controller: _nibSiup,
                      readOnly: isLoading,
                      hintText: l.enterYourNibSiup,
                      textDirection: TextDirection.ltr,
                      textInputAction: TextInputAction.done,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? l.nibSiupRequiredForBusiness
                          : null,
                    ),
                  ],

                  24.sbh,
                  CustomButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            l.createAccount,
                            style: AppStyles.styleMedium16(context)
                                .copyWith(color: Colors.white),
                          ),
                  ),
                  16.sbh,
                  Center(
                    child: TextButton(
                      onPressed:
                          isLoading ? null : () => router.go(AppRoutes.login),
                      child: Text(
                        l.alreadyHaveAccount,
                        style: AppStyles.styleRegular14(context)
                            .copyWith(color: primary),
                      ),
                    ),
                  ),
                  16.sbh,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Pemilih `BUY_R` / `BUY_B`.
class _RoleSelector extends StatelessWidget {
  const _RoleSelector({
    required this.role,
    required this.onChanged,
    required this.enabled,
  });

  final String role;
  final ValueChanged<String> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    return Row(
      children: [
        Expanded(
          child: _RoleOption(
            label: l.retailBuyer,
            value: 'BUY_R',
            selected: role == 'BUY_R',
            enabled: enabled,
            onTap: onChanged,
          ),
        ),
        12.sbw,
        Expanded(
          child: _RoleOption(
            label: l.businessBuyer,
            value: 'BUY_B',
            selected: role == 'BUY_B',
            enabled: enabled,
            onTap: onChanged,
          ),
        ),
      ],
    );
  }
}

class _RoleOption extends StatelessWidget {
  const _RoleOption({
    required this.label,
    required this.value,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final String value;
  final bool selected;
  final bool enabled;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return InkWell(
      onTap: enabled ? () => onTap(value) : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: 12.pa,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? primary : kBorderColor,
            width: selected ? 2 : 1,
          ),
          color: selected ? primary.withValues(alpha: .08) : null,
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 18,
              color: selected ? primary : kLightThirdColor,
            ),
            8.sbw,
            Expanded(
              child: Text(
                label,
                style: AppStyles.styleMedium14(context).copyWith(
                  color: selected
                      ? primary
                      : (isAppDarkMode() ? kDarkSecondColor : kLightSecondColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
