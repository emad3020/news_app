abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}

class NewsBottomNavState extends NewsAppStates {}

class AppChangeModeState extends NewsAppStates {}

class NewsLoadingState extends NewsAppStates {}

class NewsGetBusinessSuccessState extends NewsAppStates {}

class NewsGetSportsSuccessState extends NewsAppStates {}

class NewsGetScienceSuccessState extends NewsAppStates {}

class NewsGetSearchSuccessState extends NewsAppStates {}

class NewsGetBusinessErrorState extends NewsAppStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}
