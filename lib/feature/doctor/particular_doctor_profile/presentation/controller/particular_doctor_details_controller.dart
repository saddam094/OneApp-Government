import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_dashboard/presentation/view/doctor_dashboard_screen.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/data/model/particular_doctor_details_model.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/data/repository/particular_doctor_details_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class ParticularDoctorDetailsController extends GetxController{

  final _api = ParticularDoctorDetailsRepository();
  final preferences = UserPreference();

  final rxPDDetailsModel = Rxn<ParticularDoctorDetailsModel>();
  final rxRequestStatusPDDetails = Status.LOADING.obs;

  final phoneController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  final selectedValue = '-- select time --'.obs;
  List<DateTime> selectedDate = [DateTime.now()];
  final isLoadingBookAppointment = false.obs;

  void setRxPDDetailsModel(ParticularDoctorDetailsModel value) => rxPDDetailsModel.value = value;
  void setRxRequestStatusPDDetails(Status value) => rxRequestStatusPDDetails.value = value;

  void particularDoctorDetails(String doctorId){

    Map<String, dynamic> data = {
      'doctor_id': doctorId
    };

    _api.particularDoctorDetailsApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularDoctorDetailsModel particularDoctorDetailsModel = ParticularDoctorDetailsModel.fromJson(response['body-json']['body']);
        setRxPDDetailsModel(particularDoctorDetailsModel);
        rxPDDetailsModel.value!.timeList.insert(0,'-- select time --');
        setRxRequestStatusPDDetails(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Doctor Details Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPDDetails(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Doctor Details Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPDDetails(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Doctor Details Data : $error');
      }
    });

  }


  /// Book Appointment
  void bookAppointment(String doctorId)async{
    isLoadingBookAppointment.value = true;

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'doctor_id': doctorId,
      'email': email,
      'PhoneNumber': phoneController.value.text,
      'date': DateFormat('yyyy-MM-dd').format(selectedDate[0]),
      'time': selectedValue.value
    };

    _api.bookAppointmentApi(data).then((response) {

      isLoadingBookAppointment.value = false;
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
      isLoadingBookAppointment.value = false;
      if(kDebugMode){
        print('Error While Booking Appointment : $error');
      }
    });
  }

}