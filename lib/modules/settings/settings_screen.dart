import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, states) {},
      builder: (context, state) {
        return Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
