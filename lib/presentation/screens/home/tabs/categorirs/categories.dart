import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/app_styles.dart';
import 'package:news/data_model/category_DM.dart';
import 'package:news/presentation/screens/home/tabs/categorirs/widgets/category_widgets.dart';

typedef OnCategoryClicked = void Function(CategoryDm);

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});
  OnCategoryClicked onCategoryClicked;
  List<CategoryDm> categoriesList = CategoryDm.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Pick your category\n of interest',
            style: AppStyles.picCategory,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 20.h,
            ),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidgets(
                    categoryDm: categoriesList[index], index: index)),
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
