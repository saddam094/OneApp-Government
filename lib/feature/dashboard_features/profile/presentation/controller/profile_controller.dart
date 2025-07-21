import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/dashboard_features/profile/data/model/profile_model.dart';
import 'package:one_app/feature/dashboard_features/profile/data/repository/profile_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class ProfileController extends GetxController{

  final _api = ProfileRepository();
  final preferences = UserPreference();

  final rxUserProfileModel = Rxn<ProfileModel>();
  final rxRequestStatusUserProfile = Status.LOADING.obs;

  void setRxUserProfileModel(ProfileModel value) => rxUserProfileModel.value = value;
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

        ProfileModel profileModel = ProfileModel.fromJson(response['body-json']['body']);
        setRxUserProfileModel(profileModel);
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


}