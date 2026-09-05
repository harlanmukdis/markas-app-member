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
  final _phone = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();
    AuthCubit.get(context).login(
      phone: _phone.text.trim(),
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

                  AuthFieldLabel(l.phoneNumber, isRequired: true),
                  8.sbh,
                  CustomTextFormField(
                    filled: true,
                    controller: _phone,
                    readOnly: isLoading,
                    hintText: l.enterYourPhoneNumber,
                    keyboardType: TextInputType.phone,
                    // Selalu LTR: nomor telepon tidak boleh terbalik urutannya
                    // saat locale-nya Arab.
                    textDirection: TextDirection.ltr,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l.phoneRequired : null,
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
