import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/toast_component.dart';
import '../../../shared/resources/app_strings.dart';
import '../../../shared/resources/assets_manager.dart';
import '../../../shared/resources/color_manager.dart';
import '../../../shared/resources/values_manager.dart';
import '../controller/alert_controller/alert_cubit.dart';
import '../controller/alert_controller/alert_states.dart';
import '../controller/home_controller/home_cubit.dart';
import 'alirtButton.dart';
import 'button_component.dart';

class alertDialog extends StatelessWidget {
  const alertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertCubit,AlertStates>(
      listener: (context, state) {

        if (state is UploadImageSuccessState) {
          showToast(text: 'Uploaded Successfully', state: ToastStates.SUCCESS);
          Navigator.pop(context);
          HomeCubit.get(context).fetchData();


        }



      },
      builder: (context, state) {
        return AlertDialog(

          backgroundColor: ColorManager.white.withOpacity(ColorManager.opacity),
          content: ClipRRect(

            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: AppSize.s10, sigmaY: AppSize.s10),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQueryHeight(context) / AppSize.s35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 state is   UploadImageLoadingState?
                    CircularProgressIndicator(
                      color: ColorManager.primary,
                    ):SizedBox(),
                    AlertButton(
                      baseColor: ColorManager.move,
                      name: AppStrings.gallery,
                      firstColor: ColorManager.move,
                      shadowColor: ColorManager.move,
                      endColor: ColorManager.move,
                      icon: ImageAssets.gallery,
                      onTap: ()=>AlertCubit.get(context).pickMedia(),
                      borderRadius: AppSize.s15,
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) / AppSize.s60,
                    ),
                    AlertButton(
                      baseColor: ColorManager.move,
                      name: AppStrings.camera,
                      firstColor: ColorManager.move,
                      shadowColor: ColorManager.move,
                      endColor: ColorManager.move,
                      icon: ImageAssets.camera,
                      onTap: ()=>AlertCubit.get(context).pickMediaCamera(),
                      borderRadius: AppSize.s15,
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
