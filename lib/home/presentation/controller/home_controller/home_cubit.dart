import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/local/shared_preference.dart';
import '../../../../shared/network/api_constants.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../../shared/resources/constants_manager.dart';
import '../../../../shared/resources/navigation.dart';
import '../../../../shared/resources/routes_manager.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> gallery = [];

  Future<void> fetchData() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConstants.getMyGallery,
        token: CacheHelper.getData(key: AppConstants.token),
      );
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final images = jsonData['data']['images'];
        gallery = List<String>.from(images);
        print(gallery.length);

        emit(GetDataSuccessState(gallery));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> logOut({required context}) async {
    emit(LogOutLoadingState());

    await CacheHelper.deleteData(key: AppConstants.token).then((value) {
      navigateFinalTo(
          context: context, screenRoute: Routes.loginRoute);
      emit(LogOutSuccessState());
    }).catchError((onError) {
      emit(LogOutErrorState(onError));
    });
  }



}
