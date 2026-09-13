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

/// Layar login.
///
/// Menggantikan `login_view.dart` dari UI kit, yang meminta **nama + email**
/// tanpa controller dan tombolnya langsung `router.go(homeLayout)` tanpa
/// memanggil apa pun. API Markas login dengan **phone (atau email) +
/// password**, jadi fieldnya memang harus berubah, bukan sekadar disambungkan.
///
/// Tombol login sosial dari kit sengaja tidak dibawa: backend tidak punya
/// endpoint OAuth, dan tombol yang tidak melakukan apa-apa lebih buruk
/// daripada tidak ada tombol.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();
    AuthCubit.get(context).login(
      email: _email.text.trim(),
      password: _password.text,
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
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        final error = state is AuthUnauthenticated ? state.error : null;

        return Scaffold(
          appBar: customAppBar(
            context,
            '',
            action: TextButton(
              onPressed: () {},
              child: Text(
                l.needHelp,
                style: AppStyles.styleRegular14(context).copyWith(
                  color: primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: 24.psh,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (context.screenHeight * .08).sbh,
                  Center(
                    child: Text(
                      l.welcomeBack,
                      style: AppStyles.styleSemiBold24(context)
                          .copyWith(color: isAppDarkMode() ? null : kDarkColor),
                    ),
                  ),
                  16.sbh,
                  Center(
                    child: Text(
                      l.loginSubtitle,
                      textAlign: TextAlign.center,
                      style: AppStyles.styleRegular16(context).copyWith(
                        color: isAppDarkMode()
                            ? const Color(0xffE8E8E8)
                            : const Color(0xff555555),
                      ),
                    ),
                  ),
                  24.sbh,

                  if (error != null) ...[
                    AuthErrorBanner(error: error, onRetry: _submit),
                    16.sbh,
                  ],

                  // API ini masuk lewat **email**, bukan nomor HP. Nomor HP
                  // tetap boleh diisi saat mendaftar, tapi tidak bisa dipakai
                  // login — jadi kolomnya diganti, bukan ditambah.
                  AuthFieldLabel(l.email, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _email,
                    readOnly: isLoading,
                    hintText: l.enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    // Selalu LTR: alamat email tidak boleh terbalik urutannya
                    // saat locale-nya Arab.
                    textDirection: TextDirection.ltr,
                    // Kunci l10n untuk dua pesan ini belum ada, dan
                    // regenerasinya butuh `intl_utils` yang bukan
                    // dev_dependency. Ditulis langsung supaya validasinya
                    // tetap ada — bukan dibiarkan lolos.
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
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => isLoading ? null : _submit(),
                    suffix: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                    validator: (v) => (v == null || v.isEmpty)
                        ? l.passwordRequired
                        : null,
                  ),
                  8.sbh,

                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () => router.push(AppRoutes.resetPassword),
                      child: Text(
                        l.forgetPassword,
                        style: AppStyles.styleRegular12(context)
                            .copyWith(color: primary),
                      ),
                    ),
                  ),
                  16.sbh,

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
                            l.continuee,
                            style: AppStyles.styleMedium16(context)
                                .copyWith(color: Colors.white),
                          ),
                  ),
                  32.sbh,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l.dontHaveAccount,
                        style: AppStyles.styleRegular16(context),
                      ),
                      TextButton(
                        onPressed: isLoading
                            ? null
                            : () => router.push(AppRoutes.register),
                        child: Text(
                          l.register,
                          style: AppStyles.styleRegular14(context)
                              .copyWith(color: primary),
                        ),
                      ),
                    ],
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
