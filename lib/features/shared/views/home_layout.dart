import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/utils/extensions.dart';

import '../../../core/function/components.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constant.dart';
import '../../../generated/l10n.dart';
import '../cubits/home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              padding: 6.pb,
              decoration: BoxDecoration(
                color: isAppDarkMode() ? kDarkColor : kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: isAppDarkMode()
                        ? kBlackColor.withValues(alpha: .07)
                        : const Color(0x11000000),
                    blurRadius: 30,
                    offset: const Offset(0, -2),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor:
                    isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
                unselectedItemColor:
                    isAppDarkMode() ? kDarkThirdColor : kLightThirdColor,
                selectedLabelStyle: AppStyles.styleMedium10(context),
                unselectedLabelStyle: AppStyles.styleMedium10(context).copyWith(
                    color:
                        isAppDarkMode() ? kDarkThirdColor : kLightThirdColor),
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined, size: 24),
                      label: l.home),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.trending_up, size: 24),
                      label: l.trending),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_border, size: 24),
                      label: l.favorites),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 24),
                      label: l.cart),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outline, size: 24),
                      label: l.profile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
