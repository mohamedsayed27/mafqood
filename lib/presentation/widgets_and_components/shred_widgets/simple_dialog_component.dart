import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/assets_path/fonts_path.dart';

class SimpleDialogOptionWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;

  const SimpleDialogOptionWidget(
      {Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      padding: const EdgeInsets.all(20),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
          fontFamily: FontsPath.sukarBlack,
        ),
      ),
    );
  }
}
