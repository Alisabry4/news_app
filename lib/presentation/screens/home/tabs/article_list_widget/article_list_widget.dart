import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager/api_manager.dart';
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:news/data/api/model/sources_response/sourse_response.dart';
import 'package:news/presentation/screens/home/tabs/article_list_widget/article_item_wigget.dart';

// ignore: must_be_immutable
class ArticleListWidget extends StatelessWidget {
   ArticleListWidget({super.key,required this.sources});
   Sources sources;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(sourceId:  sources.id??''), builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
            }
                  if(snapshot.data?.status =='error' ||snapshot.hasError){
        return Text(snapshot.data?.message ?? 'Check internet connection');

      }
            List<Articles>articles =snapshot.data?.articles??[];
      return Expanded(child: ListView.builder(itemBuilder: (context,index)=>ArticleItemWidget(articles: articles[index]),itemCount:articles.length));



    } ,);
  }
}
