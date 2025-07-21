import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/dashboard_features/edit_profile/data/model/edit_profile_model.dart';
import 'package:one_app/feature/dashboard_features/edit_profile/data/repository/edit_profile_repository.dart';
import 'package:one_app/feature/dashboard_features/profile/presentation/controller/profile_controller.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class EditProfileController extends GetxController{

  final _api = EditProfileRepository();
  final preferences = UserPreference();

  final userProfileController = Get.put(ProfileController());

  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final bloodGroupController = TextEditingController().obs;
  final aboutController = TextEditingController().obs;

  final rxUserProfileModel = Rxn<EditProfileModel>();
  final rxRequestStatusUserProfile = Status.LOADING.obs;

  RxBool loading = false.obs;

  void setRxUserProfileModel(EditProfileModel value) => rxUserProfileModel.value = value;
  void setRxRequestStatusUserProfile(Status value) => rxRequestStatusUserProfile.value = value;

  void userProfile()async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email
    };

    _api.userProfileApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        EditProfileModel editProfileModel = EditProfileModel.fromJson(response['body-json']['body']);
        setRxUserProfileModel(editProfileModel);

        var data = rxUserProfileModel.value!;

        nameController.value.text = data.name;
        phoneController.value.text = data.phoneNumber;
        addressController.value.text = data.address;
        ageController.value.text = data.age;
        heightController.value.text = data.height;
        weightController.value.text = data.weight;
        bloodGroupController.value.text = data.bloodGroup;
        aboutController.value.text = data.about;

        setRxRequestStatusUserProfile(Status.COMPLETED);

        if(kDebugMode){
          print('User Profile Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusUserProfile(Status.ERROR);
        if(kDebugMode){
          print('Error While Set User Profile Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusUserProfile(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching User Profile Data : $error');
      }
    });

  }


  void editUserProfile() async{
    loading.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'name': nameController.value.text,
      'phoneNumber': phoneController.value.text,
      'age': ageController.value.text,
      'height': heightController.value.text,
      'weight': weightController.value.text,
      'bloodGroup': bloodGroupController.value.text,
      'about': aboutController.value.text,
      'address': addressController.value.text
    };

    _api.editUserProfileApi(data).then((response) {

      if(kDebugMode){
        print('Response: $response');
      }
      loading.value = false;

      try{

        if(response['body-json']['statusCode'] == 200){

          Utils.toastMessageSuccessful('Profile Updated Successfully');
          rxRequestStatusUserProfile.value = Status.LOADING;
          userProfile();
          userProfileController.userProfile();

        }else if(response['body-json']['statusCode'] == 401 || response['body-json']['statusCode'] == 400){

          Utils.toastMessageTop(response['body-json']['body']['message']);

        }else{
          if(kDebugMode){
            print(response.toString());
          }
        }

      }catch(e){
        if(kDebugMode){
          print('=============>>>>>>>>>>>>>>>>>>==================');
          print(e.toString());
        }
      }

    }).onError((error, stackTrace) {

      if(kDebugMode){
        print(error.toString());
      }
      loading.value = false;

    });

  }

}