import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/modules/search/search_screen.dart';
import 'package:newsApp/shared/components/components.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('New App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeAppThemeMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavIndex(index);
            },
          ),
          body: cubit.homeScreens[cubit.currentIndex],
        );
      },
    );
  }
}
