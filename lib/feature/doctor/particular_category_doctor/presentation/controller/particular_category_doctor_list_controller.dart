import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/particular_category_doctor/data/model/particular_category_doctor_list_model.dart';
import 'package:one_app/feature/doctor/particular_category_doctor/data/repository/particular_category_doctor_list_repository.dart';

class ParticularCategoryDoctorListController extends GetxController{

  final _api = ParticularCategoryDoctorListRepository();
  final rxPCDListModel = Rxn<ParticularCategoryDoctorListModel>();
  final rxRequestStatusPCDList = Status.LOADING.obs;

  void setRxPCDListModel(ParticularCategoryDoctorListModel value) => rxPCDListModel.value = value;
  void setRxRequestStatusPCDList(Status value) => rxRequestStatusPCDList.value = value;

  void particularCategoryDoctorsList(String specialist){

    Map<String, dynamic> data = {
      'specialist': specialist
    };

    _api.particularCategoryDoctorListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularCategoryDoctorListModel particularCategoryDoctorListModel = ParticularCategoryDoctorListModel.fromJson(response['body-json']);
        setRxPCDListModel(particularCategoryDoctorListModel);
        setRxRequestStatusPCDList(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Category Doctors List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPCDList(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Category Doctors Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPCDList(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Category Doctors Data : $error');
      }
    });

  }

}