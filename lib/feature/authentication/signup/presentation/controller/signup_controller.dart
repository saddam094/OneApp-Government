import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/authentication/login/presentation/view/login_screen.dart';
import 'package:one_app/feature/authentication/signup/data/model/signup_model.dart';
import 'package:one_app/feature/authentication/signup/data/repository/signup_repository.dart';
import 'package:one_app/res/utils/utils.dart';

class SignUpController extends GetxController {

  final _api = SignupRepository();
  final rxSignupModel = Rxn<SignupModel>();

  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final bloodGroupController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isChekBox = false.obs;
  RxBool loading = false.obs;

  void setRxSignupModel(SignupModel value) => rxSignupModel.value = value;

  void signup(){
    loading.value = true;

    Map<String, dynamic> data = {
      'email': emailController.value.text,
      'name': nameController.value.text,
      'phone': phoneController.value.text,
      'age': ageController.value.text,
      'height': heightController.value.text,
      'weight': weightController.value.text,
      'address': addressController.value.text,
      'bloodGroup': bloodGroupController.value.text,
      'password': passwordController.value.text
    };

    _api.signupApi(data).then((response) {

      if(kDebugMode){
        print('Response: $response');
      }
      loading.value = false;

      try{

        if(response['body-json']['statusCode'] == 200){

          SignupModel signupModel = SignupModel.fromJson(response['body-json']);
          setRxSignupModel(signupModel);

          Utils.toastMessageSuccessful('Registered Successfully');

          Get.offAll(() => const LoginScreen());

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