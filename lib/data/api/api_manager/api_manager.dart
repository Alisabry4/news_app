// ignore: unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:news/data/api/model/sources_response/sourse_response.dart';
class ApiManager {
      static const String _baseUrl ='newsapi.org';
      static const String _apikey= 'c39dd7856f974ec6840bd235c693e817';
      static const String sourcesEndPoint ='/v2/top-headlines/sources';
     static const String articlesEndPoint ='/v2/top-headlines/';
  static Future<SourceResponse> getSources(String backEndId, {String? categoryItd}) async {
    Uri url=Uri.http(_baseUrl,sourcesEndPoint,{
    'apiKey' :_apikey,
    'category' :categoryItd,

    });
   http.Response serverResponse =await http.get(url);
   Map<String,dynamic>json =jsonDecode(serverResponse.body);
   SourceResponse sourceResponse =SourceResponse.fromJson(json);
   return sourceResponse;
//https://newsapi.org/v2/top-headlines/sources?apiKey=
  }
  static Future<ArticlesResponse> getArticles({String? sourceId,String? searchKewword})async{
        Uri url=Uri.http(_baseUrl,articlesEndPoint,{
        'apiKey' :_apikey,
        'sources' :sourceId,
        'q' :searchKewword,
        });
           http.Response serverResponse =await http.get(url);
   Map<String,dynamic>json =jsonDecode(serverResponse.body);
   ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);
   return articlesResponse;

        

  }
}