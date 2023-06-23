import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/constants/constants.dart';
import '../../controllers/chat_cubit/chat_cubit.dart';
import '../../widgets_and_components/chat_widgets/build_chat_item.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

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
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                    receiverId: chatItemsList[index]['id'],
                    senderId: userId,
                  )
                      .then(
                    (value) {
                      Navigator.pushNamed(
                        context,
                        ScreenName.chatScreen,
                        arguments: ChatScreenArgs(
                          receiverId: chatItemsList[index]['id'],
                          receiverName: chatItemsList[index]['name'],
                          receiverImg: chatItemsList[index]['receiverImg'],
                        ),
                      );
                    },
                  );
                },
                child: BuildChatItem(
                  image: chatItemsList[index]['profileImage'],
                  name: chatItemsList[index]['name'],
                  text: chatItemsList[index]['lastMessage'],
                  dateTime: chatItemsList[index]['dateTime'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
