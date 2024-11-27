import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/app_styles.dart';
import 'package:news/data_model/category_DM.dart';

// ignore: must_be_immutable
class CategoryWidgets extends StatelessWidget {
  CategoryDm categoryDm;
  int index;
  CategoryWidgets({super.key, required this.categoryDm, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDm.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven ? 25.r : 0.r),
            bottomRight: Radius.circular(index.isEven ? 0.r : 25.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDm.imagePath, width: 142.w, height: 126.h),
          Text(
            categoryDm.title,
            style: AppStyles.categoryTitle,
          ),
        ],
      ),
    );
  }
}
