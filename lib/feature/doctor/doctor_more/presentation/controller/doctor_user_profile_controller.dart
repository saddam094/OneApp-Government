import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_more/data/model/doctor_user_profile_model.dart';
import 'package:one_app/feature/doctor/doctor_more/data/repository/doctor_user_profile_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class DoctorUserProfileController extends GetxController{

  final _api = DoctorUserProfileRepository();
  final preferences = UserPreference();

  final rxUserProfileModel = Rxn<DoctorUserProfileModel>();
  final rxRequestStatusUserProfile = Status.LOADING.obs;

  void setRxUserProfileModel(DoctorUserProfileModel value) => rxUserProfileModel.value = value;
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

        DoctorUserProfileModel doctorUserProfileModel = DoctorUserProfileModel.fromJson(response['body-json']['body']);
        setRxUserProfileModel(doctorUserProfileModel);
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