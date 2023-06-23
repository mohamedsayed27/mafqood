import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';
import 'package:mafqood/presentation/widgets_and_components/shred_widgets/custom_button.dart';

import '../screens/main_layout_screens/lost_person_data_screen.dart';

class SearchImageAlertDialog extends StatelessWidget {
  const SearchImageAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 250.h,
        child: BlocConsumer<LostPeopleCubit, LostPeopleState>(
          listener: (context, state) {
            var cubit = LostPeopleCubit.get(context);
            if (state is SearchForLostPersonByImageDataLoading) {
              showProgressIndicator(context);
            } else if (state is SearchForLostPersonByImageDataError) {
              Navigator.pop(context);
              Navigator.pop(context);
              showToast(
                  errorType: 1,
                  message: state.authErrorException.authErrorModel.errors[0]);
            } else if (state is SearchForLostPersonByImageDataSuccess) {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LostPersonDataScreen(lostPersonDataEntity: cubit.lostPersonDataEntity!,)));
              showToast(errorType: 0, message: state.mainResponseEntity.message!);
            }
          },
          builder: (context, state) {
            var cubit = LostPeopleCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150.h,
                  width: 150.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
                  child: cubit.searchLostPersonImage!=null?Image.file(
                    cubit.searchLostPersonImage!,
                    fit: BoxFit.cover,
                  ):null,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  buttonTitle: 'بحث بالصورة',
                  isTapped: () {
                    cubit.searchForLostPersonByImage();
                  },
                  width: double.infinity,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
