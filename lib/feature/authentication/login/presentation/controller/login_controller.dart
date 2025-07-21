import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/authentication/login/data/model/login_model.dart';
import 'package:one_app/feature/authentication/login/data/repository/login_repository.dart';
import 'package:one_app/feature/dashboard/presentation/view/dashboard_screen.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class LoginController extends GetxController {

  final _api = LoginRepository();
  final userPreferences = UserPreference();
  final rxLoginModel = Rxn<LoginModel>();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isObsecure = true.obs;
  RxBool loading = false.obs;

  void setRxLoginModel(LoginModel value) => rxLoginModel.value = value;

  void login(){
    loading.value = true;

    Map<String, dynamic> data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then((response) {

      loading.value = false;

      try{

        if(response['body-json']['statusCode'] == 200){

          LoginModel loginModel = LoginModel.fromJson(response['body-json']);
          setRxLoginModel(loginModel);

          String token = response['body-json']['body']['token'];

          userPreferences.setEmail(emailController.value.text).then((value) {
            if(kDebugMode){
              print('email saved successfully');
            }
          });

          userPreferences.setToken(token).then((value) {
            if (kDebugMode) {
              print('token saved successfully');
            }

            Utils.toastMessageSuccessful('Login Successfully');
            Get.to(() => const DashboardScreen());

          }).onError((error, stackTrace) {
            if (kDebugMode) {
              print('error while saving token');
            }
            Utils.toastMessageTop('Some thing went wrong please try again !!');
          });


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