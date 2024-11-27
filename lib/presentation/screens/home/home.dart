import 'package:flutter/material.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/data_model/category_DM.dart';
import 'package:news/presentation/screens/home/home_drawer.dart';
import 'package:news/presentation/screens/home/tabs/categories_details/categories_details.dart';
import 'package:news/presentation/screens/home/tabs/categorirs/categories.dart';
import 'package:news/presentation/screens/home/tabs/settings/settings.dart';
import 'package:news/search/new_search.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget;
  String appBarTitle = 'NewsApp';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: NewSearch());
            }, icon: Icon(Icons.search,size: 30,))
          ],
          title: Text(appBarTitle),
        ),
        drawer: HomeDrawer(
          onMenuItemClicked: onMenuItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  // void onMenuItemClicked(int pos){
  //   Navigator.pop(context);
  //   if (pos ==HomeDrawer.categories){
  //     selectedWidget =Categories();
  //   }else if(pos ==HomeDrawer.settings){
  //     selectedWidget =Settings();
  //   }
  //   setState(() {

  //   });
  // }
  void onCategoryClicked(CategoryDm categoryDm) {
    selectedWidget = CategoriesDetails(
      categoryDm: categoryDm,
    );
    appBarTitle = categoryDm.title;
    setState(() {});
  }

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        selectedWidget = Categories(
          onCategoryClicked: onCategoryClicked,
        );
      case MenuItem.settings:
        selectedWidget = Settings();
    }
    Navigator.pop(context);
    setState(() {});
  }
}
