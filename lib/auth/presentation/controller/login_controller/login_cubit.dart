import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/data/models/login_model/login_model.dart';
import '../../../../shared/local/shared_preference.dart';
import '../../../../shared/network/api_constants.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../../shared/resources/app_strings.dart';
import '../../../../shared/resources/constants_manager.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postDataFromFormData(
      url: ApiConstants.login,
      data: FormData.fromMap({
        'email': email,
        'password': password
      }),
    ).then((value) {
      print(value.data.toString());
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.setData(
          key: AppConstants.userId, value: loginModel!.user!.id);
      CacheHelper.setData(key: AppConstants.token, value: loginModel!.token);
      CacheHelper.setData(key: AppConstants.userName, value: loginModel!.user!.name);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(AppStrings.loginError));
    });
  }

  bool isObsecured = true;

  void changeVisibility() {
    isObsecured = !isObsecured;
    emit(ChangeVisibilityState(isObsecured));
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState(isPassword));
  }
}
