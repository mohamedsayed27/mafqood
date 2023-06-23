import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_colors_light_theme.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final Alignment alignment;
  const ImageContainer({Key? key, required this.imagePath, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 300.h,
        width: 200.w,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5.r)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imagePath,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0.r),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        // Image.network(imagePath,fit: BoxFit.cover,),
      ),
    );
  }
}
