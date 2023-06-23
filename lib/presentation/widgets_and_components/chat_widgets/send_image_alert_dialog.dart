import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors_light_theme.dart';
import '../../controllers/chat_cubit/chat_cubit.dart';
import '../../controllers/chat_cubit/chat_state.dart';
class AddImageAlertDialog extends StatelessWidget {
  final String receiverId;
  final String receiverName;
  final String senderName;
  final String receiverImg;
  final String senderImg;
  const AddImageAlertDialog({
    Key? key, required this.receiverId, required this.receiverName, required this.senderName, required this.receiverImg, required this.senderImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 200.h,
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {

            if(state is SendImageSuccessState){
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = ChatCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  padding: EdgeInsets.all(10.r),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(2.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 8.r,
                        )
                      ],
                      color: Colors.white),
                  child: cubit.profileImage != null
                      ? Image.file(
                    cubit.profileImage!,
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                SizedBox(height: 20.h,),

              ],
            );
          },
        ),
      ),
    );
  }
}
