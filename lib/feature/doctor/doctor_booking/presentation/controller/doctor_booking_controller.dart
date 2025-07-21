import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_booking/data/model/doctor_booking_list_model.dart';
import 'package:one_app/feature/doctor/doctor_booking/data/repository/doctor_booking_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class DoctorBookingController extends GetxController{

  final _api = DoctorBookingRepository();
  final preferences = UserPreference();

  final rxDoctorBookingListModel = Rxn<DoctorBookingListModel>();
  final rxRequestStatusDoctorBookingList = Status.LOADING.obs;

  final message = ''.obs;

  void setRxDoctorBookingListModel(DoctorBookingListModel value) => rxDoctorBookingListModel.value = value;
  void setRxRequestStatusDoctorBookingList(Status value) => rxRequestStatusDoctorBookingList.value = value;

  void bookedDoctorList()async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email
    };

    _api.bookedListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 404 || response['body-json']['statusCode'] == 400){
          message.value = response['body-json']['body']['message'];
        }
        DoctorBookingListModel doctorBookingListModel = DoctorBookingListModel.fromJson(response['body-json']);
        setRxDoctorBookingListModel(doctorBookingListModel);
        setRxRequestStatusDoctorBookingList(Status.COMPLETED);

        if(kDebugMode){
          print('Booked Doctor List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusDoctorBookingList(Status.ERROR);
        if(kDebugMode){
          print('Error While Set User Profile Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusDoctorBookingList(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching User Profile Data : $error');
      }
    });

  }

}