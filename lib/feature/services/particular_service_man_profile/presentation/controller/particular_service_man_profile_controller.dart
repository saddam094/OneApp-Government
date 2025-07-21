import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_service_man_profile/data/model/particular_service_man_profile_model.dart';
import 'package:one_app/feature/services/particular_service_man_profile/data/repository/particular_service_man_profile_repository.dart';
import 'package:one_app/feature/services/services_dashboard/presentation/view/services_dashboard_screen.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class ParticularServiceManProfileController extends GetxController{

  final _api = ParticularServiceManProfileRepository();
  final preferences = UserPreference();
  final rxPSMProfileModel = Rxn<ParticularServiceManProfileModel>();
  final rxRequestStatusPSMProfile = Status.LOADING.obs;

  final phoneController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  final selectedValue = '-- select time --'.obs;
  List<DateTime> selectedDate = [DateTime.now()];
  final isLoadingBookAppointment = false.obs;

  RxBool isLoadingSaved = false.obs;
  RxBool isLoadingBook = false.obs;

  void setRxPSMProfileModel(ParticularServiceManProfileModel value) => rxPSMProfileModel.value = value;
  void setRxRequestStatusPSMProfile(Status value) => rxRequestStatusPSMProfile.value = value;

  void particularServiceManProfile(String serviceManId) async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'serviceManId': serviceManId,
      'email': email
    };

    _api.particularServiceManProfileApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularServiceManProfileModel particularServiceManProfileModel = ParticularServiceManProfileModel.fromJson(response['body-json']['body']);
        setRxPSMProfileModel(particularServiceManProfileModel);
        rxPSMProfileModel.value!.timeList.insert(0,'-- select time --');
        setRxRequestStatusPSMProfile(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Service Man Profile Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPSMProfile(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Service Man Profile Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPSMProfile(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Service Man Profile Data : $error');
      }
    });
  }

  /// Saved UnSaved Api Call ---> Method
  void savedUnSaved(String serviceManId, bool saved) async{

    isLoadingSaved.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'saved': saved,
      'serviceManId': serviceManId
    };

    _api.savedUnsavedApi(data).then((response) {

      isLoadingSaved.value = false;

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

          // Now Call Service Man Profile Api
          particularServiceManProfile(serviceManId);

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
      isLoadingSaved.value = false;
      if(kDebugMode){
        print('Error While Fetching Saved UnSaved Response : $error');
      }
    });
  }

  /// Book Service Man ---> Method
  void bookServiceMan(String serviceManId) async{

    isLoadingBook.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'serviceManId': serviceManId,
      'phoneNumber': phoneController.value.text,
      'bookingDate': DateFormat('yyyy-MM-dd').format(selectedDate[0]).toString(),
      'bookingTime': selectedValue.value,
      'description': descriptionController.value.text
    };

    _api.serviceManBookingApi(data).then((response) {

      isLoadingBook.value = false;

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

          Get.offAll(() => const ServicesDashboardScreen());

        }
        else if(response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }

      }catch(e){
        if(kDebugMode){
          print('Error While Booking Service Man : $e');
        }
      }

    }).onError((error, stackTrace) {
      isLoadingBook.value = false;
      if(kDebugMode){
        print('Error While Fetching Booking Service Man Response : $error');
      }
    });
  }

  /// Cancel Booking Of Service Man
  void cancelBookingServiceMan(String serviceManId) async{

    isLoadingBook.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'serviceManId': serviceManId,
    };

    _api.cancelBookedServiceManApi(data).then((response) {

      isLoadingBook.value = false;

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

          Get.offAll(() => const ServicesDashboardScreen());

        }
        else if(response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }

      }catch(e){
        if(kDebugMode){
          print('Error While Cancel Booking Service Man : $e');
        }
      }

    }).onError((error, stackTrace) {
      isLoadingBook.value = false;
      if(kDebugMode){
        print('Error While Fetching Cancel Booking Service Man Response : $error');
      }
    });
  }
}