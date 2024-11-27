import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Articles? articles; // إضافة المعامل
  const NewsDetailsScreen({super.key, this.articles});

  @override
  Widget build(BuildContext context) {
    // استخدام المعامل بدلاً من جلب البيانات من ModalRoute
    if (articles == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'No article data available!',
            style: TextStyle(fontSize: 16.sp, color: Colors.red),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.bgPattern),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: articles!.urlToImage ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                articles!.source?.name ?? '',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF79828B),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                articles!.title ?? '',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF42505C),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                articles!.publishedAt ?? '',
                textAlign: TextAlign.end,
                style: GoogleFonts.inder(
                  color: const Color(0xFFA3A3A3),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                articles!.description ?? '',
                style: GoogleFonts.poppins(fontSize: 12.sp),
              ),
              Row(
                children: [
                  TextButton.icon(onPressed: (){
                    openUrl(articles!.url);


                  },icon: Text('view all Article') ,label: Icon(Icons.forward_outlined)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  void openUrl(String? url)async {
    if(url == null){
      return;
    }
    var uri =Uri.parse(url);
   if(await canLaunchUrl(uri)){
    launchUrl(uri);
   }
  }
}
