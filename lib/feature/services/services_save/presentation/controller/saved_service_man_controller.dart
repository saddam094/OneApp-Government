import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/services_save/data/model/saved_service_man_list_model.dart';
import 'package:one_app/feature/services/services_save/data/repository/saved_service_man_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class SavedServiceManController extends GetxController{

  final _api = SavedServiceManRepository();
  final preferences = UserPreference();
  final rxSavedServiceManModel = Rxn<SavedServiceManListModel>();
  final rxRequestStatusSavedServiceMan = Status.LOADING.obs;

  void setRxSavedServiceManModel(SavedServiceManListModel value) => rxSavedServiceManModel.value = value;
  void setRxRequestStatusSavedServiceMan(Status value) => rxRequestStatusSavedServiceMan.value = value;

  void savedServiceManList() async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      "email": email
    };

    _api.savedServiceManListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        SavedServiceManListModel savedServiceManListModel = SavedServiceManListModel.fromJson(response['body-json']);
        setRxSavedServiceManModel(savedServiceManListModel);
        setRxRequestStatusSavedServiceMan(Status.COMPLETED);

        if(kDebugMode){
          print('Saved Service Man List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusSavedServiceMan(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Saved Service Man List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      rxRequestStatusSavedServiceMan(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Saved Service Man List Data : $error');
      }
    });
  }

  /// Saved UnSaved Api Call ---> Method
  void savedUnSaved(String serviceManId, bool saved) async{

    // isLoadingSaved.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'saved': saved,
      'serviceManId': serviceManId
    };

    _api.savedUnsavedApi(data).then((response) {

      // isLoadingSaved.value = false;

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

          // Now Call Service Man Profile Api
          setRxRequestStatusSavedServiceMan(Status.LOADING);
          savedServiceManList();

        }
        else if(response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }

      }catch(e){
        if(kDebugMode){
          print('Error While Performing Save UnSave : $e');
        }
      }

    }).onError((error, stackTrace) {
      // isLoadingSaved.value = false;
      if(kDebugMode){
        print('Error While Fetching Saved UnSaved Response : $error');
      }
    });
  }

}