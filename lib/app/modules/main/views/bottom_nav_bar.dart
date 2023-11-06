import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/model/menu_item.dart';

//ignore
class BottomNavBar extends GetWidget<BottomNavController> {

  late AppLocalizations appLocalization;
  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    appLocalization = AppLocalizations.of(context)!;

    Color selectedItemColor = AppColors.primary400;
    Color unselectedItemColor = AppColors.neutral200;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => AnimatedBottomNavigationBar(
        icons: _getIconData(),
        activeIndex: controller.selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: AppValues.largeRadius,
        rightCornerRadius: AppValues.largeRadius,
        activeColor: selectedItemColor,
        inactiveColor: unselectedItemColor,
        onTap: (index) {
          controller.updateSelectedIndex(index);
          controller.mainController.onMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }
  
  Widget bottomNavBar(BuildContext context){

    appLocalization = AppLocalizations.of(context)!;

    Color selectedItemColor = Colors.white;
    Color unselectedItemColor = AppColors.neutral200;
    List<BottomNavItem> navItems = _getNavItems();
    
    return BottomNavigationBar(
      key: bottomNavKey,
      items: navItems
          .map(
            (BottomNavItem navItem) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "images/${navItem.iconSvgName}",
              height: AppValues.iconDefaultSize,
              width: AppValues.iconDefaultSize,
              color:
              navItems.indexOf(navItem) == controller.selectedIndex
                  ? selectedItemColor
                  : unselectedItemColor,
            ),
            label: navItem.navTitle,
            tooltip: ""),
      )
          .toList(),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorAccent,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      currentIndex: controller.selectedIndex,
      onTap: (index) {
        controller.updateSelectedIndex(index);
        controller.mainController.onMenuSelected(navItems[index].menuCode);
      },
    );
  }

  List<IconData> _getIconData(){
    return [
      Icons.home_filled,
      FontAwesome.user,
    ];
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: appLocalization.bottomNavHome,
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,),
      BottomNavItem(
          navTitle: appLocalization.bottomNavFavorite,
          iconSvgName: "ic_favorite.svg",
          menuCode: MenuCode.PROFILE),
      BottomNavItem(
          navTitle: appLocalization.bottomNavFavorite,
          iconSvgName: "ic_favorite.svg",
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: appLocalization.bottomNavSettings,
          iconSvgName: "ic_settings.svg",
          menuCode: MenuCode.SETTINGS)
    ];
  }
}
