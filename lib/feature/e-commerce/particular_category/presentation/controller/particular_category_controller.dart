import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/particular_category/data/model/particular_category_%20shop_list_model.dart';
import 'package:one_app/feature/e-commerce/particular_category/data/repository/particular_category_repository.dart';

class ParticularCategoryController extends GetxController{

  final _api = ParticularCategoryRepository();

  final rxParticularCategoryModel = Rxn<ParticularCategoryShopListModel>();
  final rxRequestStatusParticularCategory = Status.LOADING.obs;

  void setRxParticularCategoryModel(ParticularCategoryShopListModel value) => rxParticularCategoryModel.value = value;
  void setRxRequestStatusParticularCategory(Status value) => rxRequestStatusParticularCategory.value = value;

  /// Get Particular Category Shop List For E-Commerce
  void particularCategoryShopList(String category){

    Map<String, dynamic> data = {
      'category': category
    };

    _api.particularCategoryShopListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{
        ParticularCategoryShopListModel particularCategoryShopListModel= ParticularCategoryShopListModel.fromJson(response['body-json']);
        setRxParticularCategoryModel(particularCategoryShopListModel);
        setRxRequestStatusParticularCategory(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Category Shop List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusParticularCategory(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Category Shop List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusParticularCategory(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Category Shop List Data : $error');
      }
    });

  }
}