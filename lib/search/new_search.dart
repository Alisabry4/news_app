import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager/api_manager.dart';
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:news/presentation/screens/home/tabs/article_list_widget/article_item_wigget.dart';

class NewSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      showResults(context);
    }, icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(onPressed: (){
      Navigator.of(context).pop();

    }, icon: Icon(Icons.clear));
    
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(searchKewword: query), builder: (context, snapshot){
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('suggestion');

  }

}