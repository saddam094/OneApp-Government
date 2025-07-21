import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/particular_shop/data/model/particular_shop_details_model.dart';
import 'package:one_app/feature/e-commerce/particular_shop/data/model/particular_shop_particular_sub_category_products_model.dart';
import 'package:one_app/feature/e-commerce/particular_shop/data/model/particular_shop_sub_category_model.dart';
import 'package:one_app/feature/e-commerce/particular_shop/data/repository/particular_shop_repository.dart';

class ParticularShopController extends GetxController{

  final _api = ParticularShopRepository();

  final selectedSubCategory = ''.obs;
  final selectedIndex = 0.obs;

  /// Detail
  final rxParticularShopDetailsModel = Rxn<ParticularShopDetailsModel>();
  final rxRequestStatusPShopDetails = Status.LOADING.obs;

  /// category
  final rxParticularShopSubCategoryModel = Rxn<ParticularShopSubCategoryModel>();
  final rxRequestStatusPShopSubCategory = Status.LOADING.obs;

  /// product
  final rxParticularShopParticularSubcategoryAllDataModel = Rxn<ParticularShopParticularSubCategoryProductsModel>();
  final rxRequestStatusPShopParticularSubcategoryAllData = Status.LOADING.obs;

  /// Category
  void setRXParticularShopSubCategoryModel(ParticularShopSubCategoryModel value) => rxParticularShopSubCategoryModel.value = value;
  void setRxRequestStatusPShopSubCategory(Status value) => rxRequestStatusPShopSubCategory.value = value;

  /// Details
  void setRXParticularShopDetailsModel(ParticularShopDetailsModel value) => rxParticularShopDetailsModel.value = value;
  void setRxRequestStatusPShopDetails(Status value) => rxRequestStatusPShopDetails.value = value;

  /// Product
  void setRXParticularShopParticularSubcategoryAllDataModel(ParticularShopParticularSubCategoryProductsModel value) => rxParticularShopParticularSubcategoryAllDataModel.value = value;
  void setRxRequestStatusPShopParticularSubcategoryAllData(Status value) => rxRequestStatusPShopParticularSubcategoryAllData.value = value;

  /// Shop Details ---> 1
  void particularShopDetails(String shopId, category){

    Map<String, dynamic> data = {
      'shop_id': shopId,
      'category': category
    };

    _api.particularShopDetailApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularShopDetailsModel particularShopDetailsModel= ParticularShopDetailsModel.fromJson(response['body-json']['body']);
        setRXParticularShopDetailsModel(particularShopDetailsModel);
        setRxRequestStatusPShopDetails(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Shop Details Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPShopDetails(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Shop Details Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPShopDetails(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Shop Details Data : $error');
      }
    });

  }

  /// Particular Shop Product Category ---> 2
  void particularShopProductCategory(String shopId, category){

    Map<String, dynamic> data = {
      'shop_id': shopId,
      'category': category
    };

    _api.particularShopProductCategoryApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularShopSubCategoryModel particularShopSubCategoryModel = ParticularShopSubCategoryModel.fromJson(response['body-json']);
        setRXParticularShopSubCategoryModel(particularShopSubCategoryModel);
        setRxRequestStatusPShopSubCategory(Status.COMPLETED);
        selectedSubCategory.value = rxParticularShopSubCategoryModel.value!.category[0].subCategory;
        // Call Products Api
        particularShopParticularSubCategoryProducts(shopId, category);

        if(kDebugMode){
          print('Particular Shop Sub Category Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPShopSubCategory(Status.ERROR);
        setRxRequestStatusPShopParticularSubcategoryAllData(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Shop Sub Category Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPShopSubCategory(Status.ERROR);
      setRxRequestStatusPShopParticularSubcategoryAllData(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Shop Sub Category Data : $error');
      }
    });
  }

  /// Particular Shop Particular Category Products ---> 3
  void particularShopParticularSubCategoryProducts(String shopId, category){

    Map<String, dynamic> data = {
      'shop_id': shopId,
      'category': category,
      'subCategory': selectedSubCategory.value
    };

    _api.particularShopCategoryProducts(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ParticularShopParticularSubCategoryProductsModel particularShopParticularSubCategoryProductsModel = ParticularShopParticularSubCategoryProductsModel.fromJson(response['body-json']);
        setRXParticularShopParticularSubcategoryAllDataModel(particularShopParticularSubCategoryProductsModel);
        setRxRequestStatusPShopParticularSubcategoryAllData(Status.COMPLETED);

        if(kDebugMode){
          print('Particular Shop Particular Sub Category Products Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPShopParticularSubcategoryAllData(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Particular Shop Particular Sub Category Products Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPShopParticularSubcategoryAllData(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Particular Shop Particular Sub Category Products Data : $error');
      }
    });

  }

}