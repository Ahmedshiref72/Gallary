import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/local/shared_preference.dart';
import '../../../../shared/network/api_constants.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../../shared/resources/constants_manager.dart';
import 'alert_states.dart';
import 'package:image_picker/image_picker.dart';

class AlertCubit extends Cubit<AlertStates> {
  AlertCubit() : super(AlertInitialState());

  static AlertCubit get(context) => BlocProvider.of(context);

  String? imagePath;
  bool ImageChanged = false;

  void pickMedia() async {
    ImageChanged = false;
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      ImageChanged = true;
      emit(PickImageSuccessState());
    }
    if (ImageChanged == true) {
      uploadImage();
    }
  }

  void pickMediaCamera() async {
    ImageChanged = false;
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      imagePath = file.path;
      ImageChanged = true;
      emit(PickImageSuccessState());
    }
    if (ImageChanged == true) {
      uploadImage();
    }
  }

  Future<void> uploadImage() async {
    emit(UploadImageLoadingState());

    var data = FormData.fromMap({
      'img': [
        await MultipartFile.fromFile(
          imagePath!,
          filename: imagePath!.split('/').last,
        )
      ],
    });

    await DioHelper.postDataFromFormDataForImage(
            token: CacheHelper.getData(key: AppConstants.token),
            url: ApiConstants.uploadToMyGallery,
            data: data)
        .then((value) {
      imagePath = null;
      emit(UploadImageSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UploadImageErrorState(error.toString()));
    });
  }

}
