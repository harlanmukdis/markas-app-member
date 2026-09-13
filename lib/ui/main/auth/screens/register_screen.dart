import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_app_member/core/function/components.dart';
import 'package:marketplace_app_member/core/function/custom_app_bar.dart';
import 'package:marketplace_app_member/core/utils/app_routes.dart';
import 'package:marketplace_app_member/core/utils/app_styles.dart';
import 'package:marketplace_app_member/core/utils/constant.dart';
import 'package:marketplace_app_member/core/utils/extensions.dart';
import 'package:marketplace_app_member/core/widgets/custom_buttons.dart';
import 'package:marketplace_app_member/core/widgets/custom_text_form_field.dart';
import 'package:marketplace_app_member/generated/l10n.dart';
import 'package:marketplace_app_member/ui/main/auth/cubit/auth_cubit.dart';
import 'package:marketplace_app_member/ui/main/auth/widgets/auth_error_banner.dart';
import 'package:marketplace_app_member/ui/main/auth/widgets/auth_field_label.dart';

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


  bool _obscure = true;



  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();

    AuthCubit.get(context).register(
      email: _email.text.trim(),
      password: _password.text,
      fullName: _fullName.text.trim(),
      phone: _phone.text.trim(),
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

                  // Email kini **identitas login**, bukan pelengkap: API ini
                  // masuk lewat email, bukan nomor HP.
                  AuthFieldLabel(l.email, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _email,
                    readOnly: isLoading,
                    hintText: l.enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    validator: (v) {
                      final value = v?.trim() ?? '';
                      if (value.isEmpty) return 'Email wajib diisi';
                      if (!value.contains('@')) return 'Format email belum benar';
                      return null;
                    },
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
