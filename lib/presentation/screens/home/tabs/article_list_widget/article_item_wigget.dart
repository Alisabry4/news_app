import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/api/model/articles_response/articles.dart';
import 'package:news/presentation/screens/details/news_details_screen.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;

  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(articles: articles),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              articles.source?.name ?? '',
              style: GoogleFonts.poppins(
                color: const Color(0xFF79828B),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 4.h),
            
            Text(
              articles.title ?? '',
              style: GoogleFonts.poppins(
                color: const Color(0xFF42505C),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            
            Text(
              articles.publishedAt ?? '',
              textAlign: TextAlign.end,
              style: GoogleFonts.inder(
                color: const Color(0xFFA3A3A3),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(articles.description??'')
          ],
        ),
      ),
    );
  }
}
