
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetDataLoadingState extends HomeStates {}

class GetDataSuccessState extends HomeStates {
  final List<String> images;

  GetDataSuccessState(this.images);
}

class GetDataErrorState extends HomeStates {
  final String error;

  GetDataErrorState(this.error);
}

class LogOutLoadingState extends HomeStates {}

class LogOutSuccessState extends HomeStates {}

class LogOutErrorState extends HomeStates {
  final String error;

  LogOutErrorState(this.error);
}
