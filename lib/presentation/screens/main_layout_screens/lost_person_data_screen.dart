import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mafqood/core/app_router/screens_name.dart';
import 'package:mafqood/core/assets_path/svg_path.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/domain/entities/lost_person_data_entity.dart';
import 'package:mafqood/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../controllers/user_cubit/user_cubit.dart';
import '../../widgets_and_components/shred_widgets/arrow_back_button.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../chat_screens/chat_screen.dart';
import '../google_maps/live_location_screen.dart';

class LostPersonDataScreen extends StatelessWidget {
  final LostPersonDataEntity lostPersonDataEntity;

  const LostPersonDataScreen({Key? key, required this.lostPersonDataEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(lostPersonDataEntity);
    return Scaffold(
      backgroundColor:  Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        children: [
          SizedBox(
            height: 50.h,
          ),
          const LogoText(),
          const Align(
              alignment: Alignment.centerRight, child: ArrowBackButton()),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 57.w),
            child: Hero(
              tag: lostPersonDataEntity.id!,
              child: Container(
                width: double.infinity,
                height: 279.97.h,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2.w, 4.h),
                      blurRadius: 6.r,
                      color: Colors.black.withOpacity(0.25),
                    )
                  ],
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: lostPersonDataEntity.url!,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: lostPersonDataEntity.lat != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'اسم التائه',
                    style: TextStyle(
                      color: AppColors.blueTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Hero(
                    tag: "${lostPersonDataEntity.id!}name",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        lostPersonDataEntity.name!,
                        style: TextStyle(
                          color: AppColors.bottomNavBarGreyIconColor,
                          fontFamily: FontsPath.sukarBold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: lostPersonDataEntity.lat != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الاهل',
                      style: TextStyle(
                        color: AppColors.blueTextColor,
                        fontFamily: FontsPath.sukarBlack,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      lostPersonDataEntity.phoneNumber!,
                      style: TextStyle(
                        color: AppColors.bottomNavBarGreyIconColor,
                        fontFamily: FontsPath.sukarBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: lostPersonDataEntity.lat != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'موقع التائه',
                    style: TextStyle(
                      color: AppColors.blueTextColor,
                      fontFamily: FontsPath.sukarBlack,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Hero(
                    tag: "${lostPersonDataEntity.id}city",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "${lostPersonDataEntity.city!} : ${lostPersonDataEntity.area!}",
                        style: TextStyle(
                          color: AppColors.bottomNavBarGreyIconColor,
                          fontFamily: FontsPath.sukarBold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: lostPersonDataEntity.lat != null&&userId!=lostPersonDataEntity.user!.id,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تاريخ الميلاد',
                      style: TextStyle(
                        color: AppColors.blueTextColor,
                        fontFamily: FontsPath.sukarBlack,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      Jiffy(lostPersonDataEntity.birthDate!).yMMMd,
                      style: TextStyle(
                        color: AppColors.bottomNavBarGreyIconColor,
                        fontFamily: FontsPath.sukarBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'توقيت النشر',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blueTextColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 20.sp,
            ),
          ),
          Text(
            Jiffy(lostPersonDataEntity.dateAdded!).yMMMd,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.bottomNavBarGreyIconColor,
              fontFamily: FontsPath.sukarBlack,
              fontSize: 12.sp,
            ),
          ),
          Visibility(
            visible: lostPersonDataEntity.lat != null&&userId!=lostPersonDataEntity.user!.id,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اضغط علي الزر لرؤية كيفية مساعدة التائه',
                  style: TextStyle(
                    color: AppColors.blueTextColor,
                    fontFamily: FontsPath.sukarBlack,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SpeedDial(
                  children: [
                    SpeedDialChild(
                      backgroundColor: Colors.pink,
                      onTap: (){
                        if(UserCubit.get(context).userDataModel==null){
                          UserCubit.get(context).getUserData(token: token);
                        }
                        ChatCubit.get(context).getMessages(receiverId: lostPersonDataEntity.user!.id, senderId: userId).whenComplete(() {
                          Navigator.pushNamed(context, ScreenName.chatScreen,arguments: ChatScreenArgs(receiverId: lostPersonDataEntity.user!.id, receiverName: lostPersonDataEntity.user!.fullName, receiverImg: lostPersonDataEntity.user!.photo));
                        });
                      },
                      child: SvgPicture.asset(
                        SvgPath.messageIcon,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    SpeedDialChild(
                      backgroundColor: Colors.purple,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveLocationScreen(destinationLocation: LatLng(lostPersonDataEntity.lat!,lostPersonDataEntity.long!))));
                      },
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  child: SvgPicture.asset(
                    SvgPath.addIcon,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
