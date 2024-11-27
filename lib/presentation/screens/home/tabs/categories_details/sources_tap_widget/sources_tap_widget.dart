import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/data/api/model/sources_response/sourse_response.dart';
import 'package:news/presentation/screens/home/tabs/article_list_widget/article_list_widget.dart';
import 'package:news/presentation/screens/home/tabs/categories_details/sources_tap_widget/sources_item_widget.dart';

// ignore: must_be_immutable
class SourcesTapWidget extends StatefulWidget {
   SourcesTapWidget({super.key,required this.sources});
  List<Sources>sources;

  @override
  State<SourcesTapWidget> createState() => _SourcesTapWidgetState();
}

class _SourcesTapWidgetState extends State<SourcesTapWidget> {
  int tappedIndex =0;

  @override
  Widget build(BuildContext context) {
     return 
      // ignore: dead_code
      Column(
        children: [
          DefaultTabController(
              length: widget.sources.length,
              child:  TabBar(
          onTap: (inddex) {
             tappedIndex =inddex;
             setState(() {
               
             });
          
          },
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding: REdgeInsets.symmetric(horizontal: 8),
          isScrollable: true,
              tabs:widget.sources.map((source)=>SourcesItemWidget(sources: source, isSelected: widget.sources.indexOf(source)==tappedIndex),).toList()
            ),
            ),
            ArticleListWidget(sources:widget.sources[tappedIndex])
        ],
      );

  }
}