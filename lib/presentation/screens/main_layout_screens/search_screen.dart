import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors_light_theme.dart';
import '../../widgets_and_components/search_image_alert_dialog.dart';
import '../../widgets_and_components/search_text_field.dart';
import '../../widgets_and_components/search_widget_builder.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';
import '../../widgets_and_components/shred_widgets/simple_dialog_option.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    var cubit = LostPeopleCubit.get(context);
    if (cubit
        .getAllLostDataList
        .isEmpty) {
      cubit.getAllLost();
    }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        cubit.getAllLost();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const LogoText(),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<LostPeopleCubit, LostPeopleState>(
              listener: (context, state) {
                if (state is GetPickedImageSuccessState) {
                  showDialog(
                      context: context,
                      builder: (context) => const SearchImageAlertDialog());
                }
              },
              builder: (context, state) {
                var cubit = LostPeopleCubit.get(context);
                return SearchTextField(
                  controller: searchController,
                  onSearchPressed: (){
                    cubit.searchForLostPersonByName(name: searchController.text);
                  },
                  onCameraClicked: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            "قم بأختيار صورة",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontFamily: FontsPath.sukarBold,
                            ),
                          ),
                          children: [
                            CustomSimpleDialogOption(
                              title: 'التقط صوره',
                              onPressed: () {
                                Navigator.of(context).pop();
                                cubit.getImagePick(
                                  0,
                                  cubit.searchLostPersonImage,
                                );
                              },
                            ),
                            CustomSimpleDialogOption(
                              title: 'قم بأختيار صورة',
                              onPressed: () {
                                Navigator.of(context).pop();
                                cubit.getImagePick(
                                  1,
                                  cubit.searchLostPersonImage,
                                );
                              },
                            ),
                            CustomSimpleDialogOption(
                              title: 'الغاء',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: BlocConsumer<LostPeopleCubit, LostPeopleState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = LostPeopleCubit.get(context);
                  return ListView.builder(
                    itemCount: cubit.getAllLostDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: SearchWidgetBuilder(
                          textDirection: index % 2 == 0
                              ? TextDirection.ltr
                              : TextDirection.rtl, getAllLostDataEntity: cubit.getAllLostDataList[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}