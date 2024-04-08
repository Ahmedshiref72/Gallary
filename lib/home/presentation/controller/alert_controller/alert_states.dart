abstract class AlertStates {}

class AlertInitialState extends AlertStates {}

class AlertLoadingState extends AlertStates {}

class UploadImageLoadingState extends AlertStates {}

class UploadImageSuccessState extends AlertStates {}

class UploadImageErrorState extends AlertStates {
  final String error;

  UploadImageErrorState(this.error);
}

class PickImageLoadingState extends AlertStates {}

class PickImageSuccessState extends AlertStates {}
