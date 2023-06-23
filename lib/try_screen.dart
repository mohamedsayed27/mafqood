import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_cubit.dart';
import 'package:mafqood/presentation/controllers/lost_people_cubit/lost_people_state.dart';

import 'core/assets_path/gif_path.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            print(Navigator.of(context).widget.pages);
          },
          child: Image.asset(GifPath.threeDotsLoading),
        ),
      ),
    );
  }
}
