import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import '../../widgets_and_components/shred_widgets/lost_people_widget_builder.dart';
import '../../widgets_and_components/shred_widgets/logo_text.dart';

class AllSurvivalsScreen extends StatefulWidget {
  const AllSurvivalsScreen({Key? key}) : super(key: key);

  @override
  State<AllSurvivalsScreen> createState() => _AllSurvivalsScreenState();
}

class _AllSurvivalsScreenState extends State<AllSurvivalsScreen> {
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    var cubit = LostPeopleCubit.get(context);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        cubit.getAllSurvivals();
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            const LogoText(),
            SizedBox(
              height: 5.h,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
                size: 35.r,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: BlocConsumer<LostPeopleCubit, LostPeopleState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = LostPeopleCubit.get(context);
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.getAllSurvivalsDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: LostPeopleWidgetBuilder(
                                textDirection: index % 2 == 0
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                lostPersonDataEntity:
                                    cubit.getAllSurvivalsDataList[index],
                              ),
                            );
                          },
                        ),
                      ),
                      if (state is GetMoreOfAllSurvivalsDataLoading)
                        SizedBox(
                          height: 10.h,
                        ),
                      if (state is GetMoreOfAllSurvivalsDataLoading)
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state is GetMoreOfAllSurvivalsDataLoading)
                        SizedBox(
                          height: 10.h,
                        ),
                    ],
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
