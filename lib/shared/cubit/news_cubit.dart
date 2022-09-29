import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/models/news_factory.dart';
import 'package:newsApp/models/news_type.dart';
import 'package:newsApp/modules/business/business_screen.dart';
import 'package:newsApp/modules/science/science_screen.dart';
import 'package:newsApp/modules/sports/sport_screen.dart';
import 'package:newsApp/shared/cubit/news_states.dart';
import 'package:newsApp/shared/network/local/cache_helper.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  int currentIndex = 0;
  bool isDarkMode = CacheHelper.getData(key: 'isDark');
  List<Widget> homeScreens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    // SettingScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    /*BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),*/
  ];

  List<dynamic> businessList = [];
  List<dynamic> sportsList = [];
  List<dynamic> scienceList = [];
  List<dynamic> searchList = [];

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeBottomNavIndex(index) {
    currentIndex = index;
    if (index == 1) {
      loadSportsData();
    } else if (index == 2) {
      loadScienceData();
    }
    emit(NewsBottomNavState());
  }

  void changeAppThemeMode() {
    isDarkMode = !isDarkMode;
    CacheHelper.putData(key: 'isDark', value: isDarkMode).then((value) {
      emit(AppChangeModeState());
    });
  }

  void loadBusinessData() {
    emit(NewsLoadingState());
    News(type: NewsType.business).getData().then((value) {
      businessList = value?.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void loadSportsData() {
    emit(NewsLoadingState());
    News(type: NewsType.sports).getData().then((value) {
      sportsList = value?.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void loadScienceData() {
    emit(NewsLoadingState());
    News(type: NewsType.science).getData().then((value) {
      scienceList = value?.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void searchNews({required String searchKey}) {
    searchList = [];
    emit(NewsLoadingState());
    News(type: NewsType.search, searchKey: searchKey).getData().then((value) {
      searchList = value?.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error));
    });
  }
}
