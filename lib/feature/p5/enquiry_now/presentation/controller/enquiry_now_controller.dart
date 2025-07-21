import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/p5/enquiry_now/data/repository/enquiry_now_repository.dart';
import 'package:one_app/res/utils/utils.dart';

class EnquiryNowController extends GetxController{

  final _api = EnquiryNowRepository();

  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final requirementController = TextEditingController().obs;

  RxBool loading = false.obs;

  void enquiryNow(){
    loading.value = true;

    Map<String, dynamic> data = {
      'name': nameController.value.text,
      'email': emailController.value.text,
      'number': phoneController.value.text,
      'requirement': requirementController.value.text,
    };

    _api.enquiryNowApi(data).then((response) {

      if(kDebugMode){
        print('Response: $response');
      }
      loading.value = false;

      try{

        if(response['body-json']['statusCode'] == 200){

          Utils.toastMessageSuccessful('Enquiry Registered Successfully');

          nameController.value.text = '';
          emailController.value.text = '';
          phoneController.value.text = '';
          requirementController.value.text = '';

        }else if(response['body-json']['statusCode'] == 401 || response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          if(kDebugMode){
            print(response.toString());
          }
        }

      }catch(e){
        if(kDebugMode){
          print('=============>>>>>>>>>>>>>>>>>>==================');
          print(e.toString());
        }
      }

    }).onError((error, stackTrace) {

      if(kDebugMode){
        print(error.toString());
      }
      loading.value = false;

    });

  }

}