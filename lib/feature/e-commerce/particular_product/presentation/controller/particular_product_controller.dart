import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/particular_product/data/model/particular_product_model.dart';
import 'package:one_app/feature/e-commerce/particular_product/data/repository/particular_product_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class ParticularProductController extends GetxController{

  final _api = ParticularProductRepository();
  final userPreference = UserPreference();

  final rxParticularProductModel = Rxn<ParticularProductModel>();
  final rxRequestStatus = Status.LOADING.obs;

  final rxCounter = 1.obs;
  final rxIndex = 10000000.obs;

  final color = '-- select color --'.obs;
  final size = '-- select size --'.obs;



  void setRxIndex(int _value) => rxIndex.value = _value;

  void setRxParticularProductData(ParticularProductModel _value) => rxParticularProductModel.value = _value;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  /// Particular Product All Details
  void particularProductApi(String productId, skuId, category) async {

    Map<String, dynamic> data = {
      "productId": productId,
      'skuId': skuId,
      'category': category
    };
    
    _api.particularProductApi(data).then((response) {

      if(kDebugMode){
        print('Api response received');
        print(response);
      }
      
      try{

        ParticularProductModel particularProductModel = ParticularProductModel.fromJson(response['body-json']['body']);
        setRxParticularProductData(particularProductModel);
        setRxRequestStatus(Status.COMPLETED);

        if(kDebugMode){
          print('Particular product data fetched successfully');
        }
        
      }catch(e){
        setRxRequestStatus(Status.ERROR);
        if(kDebugMode){
          print('Error while fetching Particular Product Data response : $e');
        }
      }
      
      
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      if(kDebugMode){
        print('Error while parsing Particular Product Data response : $error');
      }
    });
  }

}