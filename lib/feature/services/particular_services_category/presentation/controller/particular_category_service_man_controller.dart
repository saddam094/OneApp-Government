import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_services_category/data/model/particular_category_services_man_list_model.dart';
import 'package:one_app/feature/services/particular_services_category/data/repository/particular_services_category_repository.dart';

class ParticularCategoryServiceManController extends GetxController{

  final _api = ParticularServicesCategoryRepository();
  final rxPCSMLModel = Rxn<ParticularCategoryServicesManListModel>();
  final rxRequestStatusPCSML = Status.LOADING.obs;

  void setRxPCSMLModel(ParticularCategoryServicesManListModel value) => rxPCSMLModel.value = value;
  void setRxRequestStatusPCSML(Status value) => rxRequestStatusPCSML.value = value;

  void particularCategoryServiceManList(String category){

    Map<String, dynamic> data = {
      'category': category
    };

    _api.particularCategoryServiceManListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularCategoryServicesManListModel particularCategoryServicesManListModel = ParticularCategoryServicesManListModel.fromJson(response['body-json']);
        setRxPCSMLModel(particularCategoryServicesManListModel);
        setRxRequestStatusPCSML(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Category Service Man List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPCSML(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Category Service Man List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPCSML(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Category Service Man List Data : $error');
      }
    });
  }

}