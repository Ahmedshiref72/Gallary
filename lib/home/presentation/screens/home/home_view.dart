import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/no_data_widget.dart';
import '../../../../shared/components/screen_background.dart';
import '../../../../shared/resources/app_strings.dart';
import '../../../../shared/resources/assets_manager.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../../../shared/resources/values_manager.dart';
import '../../components/alert_dialoge.dart';
import '../../components/button_component.dart';
import '../../components/grid_view_component.dart';
import '../../controller/home_controller/home_cubit.dart';
import '../../controller/home_controller/home_states.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        body: RefreshIndicator(
          onRefresh: ()async{
          await  HomeCubit.get(context).fetchData();
          },
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ScreenBackground(
                backGroundAsset: ImageAssets.homeBackground,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Welcome \nMina',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontFamily: FontConstants.fontFamilyBaloo)),
                          const Spacer(),
                          const CircleAvatar(
                              radius: AppSize.s35,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                ImageAssets.profilePic,
                              )
                              ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQueryHeight(context) / AppSize.s35,
                      ),
                      Row(
                        children: [
                          //log out
                          DynamicButton(
                            baseColor: ColorManager.white,
                            name: AppStrings.logOut,
                            firstColor: ColorManager.darkRed,
                            shadowColor: ColorManager.lightRed,
                            endColor: ColorManager.lightRed,
                            icon: ImageAssets.leftArrowIcon,
                            onTap: () =>
                                HomeCubit.get(context).logOut(context: context),
                            borderRadius: AppSize.s25,
                          ),
                          const Spacer(),
                          // upload image
                          DynamicButton(
                            name: AppStrings.upload,
                            firstColor: ColorManager.darkYellow,
                            shadowColor: ColorManager.lightYellow,
                            endColor: ColorManager.lightYellow,
                            icon: ImageAssets.upArrowIcon,
                            borderRadius: AppSize.s25,
                            onTap: () => showDialog(
                                context: context,
                                builder: (_) {
                                  return alertDialog();
                                }),
                            baseColor: ColorManager.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQueryHeight(context) / AppSize.s35,
                      ),
                      ConditionalBuilder(
                        condition: (state is GetDataLoadingState),
                        builder: (context) =>
                            NoDataWidget(AppStrings.noImagesYet),
                        fallback: (context) => GridViewComponent(
                          images: HomeCubit.get(context).gallery,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
