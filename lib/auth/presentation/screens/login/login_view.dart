import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/components/MainTextFormField.dart';
import '../../../../auth/presentation/components/main_button.dart';
import '../../../../auth/presentation/controller/login_controller/login_cubit.dart';
import '../../../../auth/presentation/controller/login_controller/login_states.dart';
import '../../../../shared/components/screen_background.dart';
import '../../../../shared/components/toast_component.dart';
import '../../../../shared/resources/app_strings.dart';
import '../../../../shared/resources/assets_manager.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/navigation.dart';
import '../../../../shared/resources/routes_manager.dart';
import '../../../../shared/resources/text_field_validation.dart';
import '../../../../shared/resources/values_manager.dart';
import '../../components/login_cliprect.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
              showToast(text: 'Login Successfully', state: ToastStates.SUCCESS);
              _emailController.text = '';
              _passwordController.text = '';
              navigateFinalTo(
                  context: context, screenRoute: Routes.homeScreenRoute);

          } else if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);

          }
        },
        builder: (context, state) {
          return ScreenBackground(
            backGroundAsset: ImageAssets.loginBackground,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      AppStrings.appTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: LoginClipRect(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              AppStrings.login,
                              style:
                              Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                                height: mediaQueryHeight(context) /
                                    AppSize.s30),
                            MainTextFormField(
                              controller: _emailController,
                              label: AppStrings.userName,
                              hint: AppStrings.userName,
                              hintColor: ColorManager.lightGrey,
                              inputType: TextInputType.emailAddress,
                              isObsecured: false,
                              validator: (value) => validateEmail(value!),
                            ),
                            SizedBox(
                                height: mediaQueryHeight(context) /
                                    AppSize.s30),
                            MainTextFormField(
                              isObsecured:
                              LoginCubit.get(context).isObsecured,
                              suffixIcon: IconButton(
                                  color: Colors.white,
                                  icon:
                                  LoginCubit.get(context).isObsecured
                                      ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorManager.lightBlue,
                                  )
                                      : const Icon(
                                    Icons.visibility,
                                    color: ColorManager.lightBlue,
                                  ),
                                  onPressed: () {
                                    LoginCubit.get(context)
                                        .changeVisibility();
                                  }),
                              controller: _passwordController,
                              label: AppStrings.password,
                              hint: AppStrings.passwordExample,
                              hintColor: ColorManager.lightGrey,
                              inputType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.length < AppSize.s8) {
                                  return AppStrings.enterValidPassword;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                                height: mediaQueryHeight(context) /
                                    AppSize.s30),
                            ConditionalBuilder(
                                condition: (state is LoginLoadingState),
                                builder: (context) =>
                                const CircularProgressIndicator(),
                                fallback: (context) => MainButton(
                                  title: AppStrings.submit,
                                  onPressed: () {
                                    if (_formKey.currentState!
                                        .validate()) {
                                      LoginCubit.get(context)
                                          .userLogin(
                                          email: _emailController
                                              .text
                                              .trim(),
                                          password:
                                          _passwordController
                                              .text);
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
