import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/app_styles.dart';
import 'package:news/core/utils/colors_manager.dart';

//9.45
typedef OnMenuItemClicked = void Function(MenuItem);

// ignore: must_be_immutable
class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});
  OnMenuItemClicked onMenuItemClicked;
  static const int categories = 0;
  static const int settings = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: Text(
              'News App!',
              style: AppStyles.drawerTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.categories);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Categories',
                        style: AppStyles.draweritem,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.settings);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Settings',
                        style: AppStyles.draweritem,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
