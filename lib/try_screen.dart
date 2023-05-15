import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LostPeopleCubit, LostPeopleState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("clickkkkk"),
            ),
          );
        },
      ),
    );
  }
}
