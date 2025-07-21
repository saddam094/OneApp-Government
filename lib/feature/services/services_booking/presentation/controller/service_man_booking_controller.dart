import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/services_booking/data/model/booked_service_man_list_model.dart';
import 'package:one_app/feature/services/services_booking/data/repository/service_man_booking_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class ServiceManBookingController extends GetxController{

  final _api = ServiceManBookingRepository();
  final preferences = UserPreference();

  final rxBSMListModel = Rxn<BookedServiceManListModel>();
  final rxRequestStatusBSMList = Status.LOADING.obs;

  void setRxBSMListModel(BookedServiceManListModel value) => rxBSMListModel.value = value;
  void setRxRequestStatusBSMList(Status value) => rxRequestStatusBSMList.value = value;

  /// Booked Service Man List ---> Fetching Data
  void bookedServiceManList() async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email
    };

    _api.bookedServiceManListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        BookedServiceManListModel bookedServiceManListModel = BookedServiceManListModel.fromJson(response['body-json']['body']);
        setRxBSMListModel(bookedServiceManListModel);
        setRxRequestStatusBSMList(Status.COMPLETED);

        if(kDebugMode){
          print('Booked Service Man List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusBSMList(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Booked Service Man List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusBSMList(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Booked Service Man List Data : $error');
      }
    });
  }

}