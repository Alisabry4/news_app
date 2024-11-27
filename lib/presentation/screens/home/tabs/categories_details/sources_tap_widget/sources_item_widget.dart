import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/data/api/model/sources_response/sourse_response.dart';

// ignore: must_be_immutable
class SourcesItemWidget extends StatelessWidget {
   SourcesItemWidget({super.key,required this.sources,required this.isSelected});
  Sources sources;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 8,),
      decoration: BoxDecoration(
              color: isSelected?ColorsManager.green:Colors.transparent,

        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: ColorsManager.green,width: 2)
      ),
      child: Text(sources.name??'',style: GoogleFonts.exo(color: isSelected?ColorsManager.white:ColorsManager.green,
      fontSize: 14,fontWeight: FontWeight.w400
      ,
),),
    );
  }
}