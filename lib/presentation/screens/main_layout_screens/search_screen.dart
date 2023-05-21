import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import '../../widgets_and_components/search_text_field.dart';
import '../../widgets_and_components/search_widget_builder.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                if(state is SearchForLostPersonDataError){
                  showToast(errorType: 1, message: state.authErrorException.authErrorModel.errors[0]);
                }else if(state is SearchForLostPersonDataSuccess){
                  showToast(errorType: 0, message: state.lostPersonEntity.message!);
                }
              },
              builder: (context, state) {
                var cubit = LostPeopleCubit.get(context);
                return SearchTextField(
                  onCameraClicked: () {
                    cubit.selectImage(context,cubit.searchLostPersonImage);
                  },
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: SearchWidgetBuilder(
                      textDirection: index % 2 == 0
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                    ),
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
