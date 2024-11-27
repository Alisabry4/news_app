import 'package:flutter/material.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/constant_manager.dart';
import 'package:news/core/utils/strings_managers.dart';

class CategoryDm {
  String backEndId;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDm(
      {required this.backEndId,
      required this.title,
      required this.bgColor,
      required this.imagePath});
  static List<CategoryDm> getCategoriesList() => [
        CategoryDm(
            backEndId: ConstantManager.sportsBakEndId,
            title: StringsManagers.sports,
            bgColor: ColorsManager.red,
            imagePath: AssetsManager.sports),
        CategoryDm(
            backEndId: ConstantManager.generalBakEndId,
            title: StringsManagers.general,
            bgColor: ColorsManager.darkBlue,
            imagePath: AssetsManager.general),
        CategoryDm(
            backEndId: ConstantManager.healthBakEndId,
            title: StringsManagers.health,
            bgColor: ColorsManager.pink,
            imagePath: AssetsManager.health),
        CategoryDm(
            backEndId: ConstantManager.businessBakEndId,
            title: StringsManagers.business,
            bgColor: ColorsManager.brown,
            imagePath: AssetsManager.business),
        CategoryDm(
            backEndId: ConstantManager.entertainmentBakEndId,
            title: StringsManagers.entertainment,
            bgColor: ColorsManager.blue,
            imagePath: AssetsManager.environment),
        CategoryDm(
            backEndId: ConstantManager.scienceBakEndId,
            title: StringsManagers.science,
            bgColor: ColorsManager.yellow,
            imagePath: AssetsManager.science),
        CategoryDm(
            backEndId: ConstantManager.technologyBakEndId,
            title: StringsManagers.technology,
            bgColor: ColorsManager.green,
            imagePath: AssetsManager.tech),
      ];
}
