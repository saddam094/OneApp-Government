import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/doctor/cancel_doctor_appointment/data/repository/cancel_appointment_repository.dart';
import 'package:one_app/feature/doctor/doctor_dashboard/presentation/view/doctor_dashboard_screen.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class CancelAppointmentController extends GetxController{

  final _api = CancelAppointmentRepository();
  final preferences = UserPreference();
  final isLoadingCancelAppointment = false.obs;

  void cancelAppointment(String doctorId)async{
    isLoadingCancelAppointment.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'doctor_id': doctorId,
      'email': email
    };

    _api.cancelAppointmentApi(data).then((response) {

      isLoadingCancelAppointment.value = false;
      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200) {
          Utils.toastMessageSuccessful(
              response['body-json']['body']['message']);
          Get.offAll(() => DoctorDashboardScreen());
        }
        else if(response['body-json']['statusCode'] == 400 || response['body-json']['statusCode'] == 404){
          Utils.toastMessageTop(
              response['body-json']['body']['message']);
        }

      }catch(e){
        if(kDebugMode){
          print('Error In Catch : $e');
        }
      }

    }).onError((error, stackTrace) {
      isLoadingCancelAppointment.value = false;
      if(kDebugMode){
        print('Error While Booking Appointment : $error');
      }
    });
  }

}