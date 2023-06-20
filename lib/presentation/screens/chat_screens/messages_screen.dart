import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/constants/constants.dart';
import '../../controllers/chat_cubit/chat_cubit.dart';
import 'chat_screen.dart';

class VendorMessagesScreen extends StatelessWidget {
  const VendorMessagesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          'المحادثات',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: FontsPath.sukarBold,
              color: const Color(0xff1E2432)),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("chats")
            .orderBy("dateTime")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Map<String, dynamic>> chatItemsList =
          snapshot.data!.docs.reversed.map((e) => e.data()).toList();
          return ListView.builder(
            itemCount: chatItemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  ChatCubit.get(context)
                      .getMessages(
                      receiverId: chatItemsList[index]['id'], senderId: userId)
                      .then(
                        (value) {
                      Navigator.pushNamed(
                          context, ScreenName.chatScreen,
                          arguments: ChatScreenArgs( receiverId: chatItemsList[index]['id'], receiverName: chatItemsList[index]['name'], receiverImg:chatItemsList[index]['receiverImg'],));
                    },
                  );
                },
                child: buildChatItem(image: "${chatItemsList[index]['profileImage']}", name: chatItemsList[index]['name'], text: chatItemsList[index]['lastMessage'], dateTime: chatItemsList[index]['dateTime']),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildChatItem({required String? image, required String name, required String text, required String dateTime}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
        height: 75.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 16.r,
                color: Colors.black.withOpacity(0.14))
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52.h,
              width: 48.w,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child:CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                "$image",
                placeholder: (context, url) =>
                    Shimmer.fromColors(
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
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontsPath.sukarBold,
                        fontSize: 13.sp),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: const Color(0xff939FB5),
                        fontFamily: FontsPath.sukarRegular,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              Jiffy(dateTime).Hm,
              style: TextStyle(
                  color: const Color(0xff939FB5),
                  fontFamily: FontsPath.sukarRegular,
                  fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
