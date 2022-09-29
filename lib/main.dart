import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsApp/shared/bloc_observer.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';
import 'package:newsApp/shared/network/local/cache_helper.dart';
import 'package:newsApp/shared/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(
    BlocProvider(
        create: (context) => NewsCubit()..loadBusinessData(),
        child: BlocConsumer<NewsCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    elevation: 0.0,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Colors.white,
                      elevation: 20.0),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
              themeMode: NewsCubit.get(context).isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: HexColor('333739'),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    backgroundColor: HexColor('333739'),
                    elevation: 20.0),
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              home: NewsLayout(),
            );
          },
        )),
  );
}
