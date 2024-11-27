import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager/api_manager.dart';
import 'package:news/data/api/model/sources_response/sourse_response.dart';
import 'package:news/data_model/category_DM.dart';
import 'package:news/presentation/screens/home/tabs/categories_details/sources_tap_widget/sources_tap_widget.dart';

// ignore: must_be_immutable
class CategoriesDetails extends StatelessWidget {
  CategoriesDetails({super.key, required this.categoryDm});
  CategoryDm categoryDm;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getSources(categoryDm.backEndId), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshot.data?.status =='error' ||snapshot.hasError){
        return Text(snapshot.data?.message ?? 'Check internet connection');

      }
      // ignore: unused_local_variable
      List<Sources>sources =snapshot.data?.sources??[];
      return SourcesTapWidget(sources:sources);

    },);
  }
}
