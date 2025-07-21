import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/authentication/login/presentation/controller/login_controller.dart';
import 'package:one_app/feature/authentication/signup/presentation/view/signup_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:one_app/res/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginVM = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constant.height * 1,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .04,
          right: Constant.width * .04,
        ),
        // decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: Constant.height * .04),
                /// Welcome Back! ---> It will be Text
                CommonText(text: 'Welcome Back!', color: AppColors.primaryColor,fontSize: Constant.width * .1,fontWeight: FontWeight.bold, fontFamily: 'Pacifico',),

                /// Login To Continue.... ---> It will be Text
                Text('Login To Continue......', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.w200, color: AppColors.black),),

                SizedBox(
                  height: Constant.height * .075,
                ),

                /// Image Box ---> It will be an image
                Container(
                  height: Constant.height * .3,
                  width: Constant.width * .7,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/vaidika.png'),
                      //   fit: BoxFit.fill,
                      // )
                  ),
                  child: Center(
                    child: Text('Logo Image', style: TextStyle(fontSize: Constant.width * .05,  fontWeight: FontWeight.bold, color: AppColors.white)),
                  ),
                ),

                SizedBox(
                  height: Constant.height * .075,
                ),

                /// Email ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: loginVM.emailController.value,
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.email_outlined, color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Email');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .01),

                /// Password ---> It will be TextField
                Obx(() {
                  return CommonTextField(
                    obSecure: loginVM.isObsecure.value,
                    controller: loginVM.passwordController.value,
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor),
                    icon: const Icon(Icons.lock_outline, color: AppColors.greyTextDarkColor),
                    suffixIcon: IconButton(
                      icon: Icon(loginVM.isObsecure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.greyTextDarkColor),
                      onPressed: () {
                        loginVM.isObsecure.value = !loginVM.isObsecure.value;
                      },
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        Utils.toastMessageTop('Enter Password');
                      }
                      return null;
                    },
                  );
                }),

                SizedBox(height: Constant.height * .08),

                /// Log in Button
                Obx(() {
                  return CommonButton(
                    title: 'Log In',
                    onTap: () {
                      loginVM.login();
                    },
                    height: Constant.height * .06,
                    isLoading: loginVM.loading.value,
                  );
                }),

                SizedBox(height: Constant.height * .02),

                /// Create Account
                CommonButton(
                  title: 'Create Account',
                  onTap: () {
                    // function for Create Account
                    Get.to(() => const SignUpScreen());
                  },
                  height: Constant.height * .06,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}