import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/authentication/login/presentation/view/login_screen.dart';
import 'package:one_app/feature/authentication/signup/presentation/controller/signup_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:one_app/res/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final signUpVM = Get.put(SignUpController());

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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: Constant.height * .07),

                /// Sign Up A New Account ---> It will be Text
                CommonText(text: 'SignUp A New Account', color: AppColors.primaryColor,fontSize: Constant.width * .07,fontWeight: FontWeight.bold, fontFamily: 'Pacifico',),

                SizedBox(
                  height: Constant.height * .03,
                ),

                /// Image Box ---> It will be an image
                Container(
                  height: Constant.height * .2,
                  width: Constant.width * .7,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/vaidika.png'),
                      //   fit: BoxFit.fill,
                      // )
                  ),
                  child: Center(
                    child: Text('Logo Image', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.w500, color: AppColors.white),),
                  ),
                ),

                SizedBox(
                  height: Constant.height * .03,
                ),


                /// Name ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.nameController.value,
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Name');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Email ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.emailController.value,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.email_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Email');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Phone Number ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.phoneController.value,
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.call_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Mobile Number');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// age ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.ageController.value,
                  hintText: 'Age',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Age');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// height ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.heightController.value,
                  hintText: 'Height (Optional)',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Height');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// weight ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.weightController.value,
                  hintText: 'Weight (Optional)',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Weight');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Blood Group ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.bloodGroupController.value,
                  hintText: 'Blood Group (Optional)',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Blood Group');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Address ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.addressController.value,
                  hintText: 'Address',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.person_2_outlined,
                      color: AppColors.greyTextDarkColor),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Address');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Password ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.passwordController.value,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.lock_outline,
                      color: AppColors.greyTextDarkColor),
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Password');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Confirm Password ---> It will be TextField
                CommonTextField(
                  obSecure: false,
                  controller: signUpVM.confirmPasswordController.value,
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                      fontSize: Constant.width * .04,
                      color: AppColors.greyTextDarkColor),
                  icon: Icon(Icons.lock_outline,
                      color: AppColors.greyTextDarkColor),
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.toastMessageTop('Enter Confirm Password');
                    }
                    return null;
                  },
                ),

                SizedBox(height: Constant.height * .005),

                /// Check Box and I Agree all Term & Condition
                // Container(
                //   height: Constant.height * .05,
                //   width: Constant.width * 1,
                //   child: Row(
                //     children: [
                //       Obx(() {
                //         return Checkbox(
                //           value: signUpVM.isChekBox.value,
                //           activeColor: Colors.green,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(2),
                //           ),
                //           onChanged: (bool? value) {
                //             signUpVM.isChekBox.value = !signUpVM.isChekBox.value;
                //           },
                //         );
                //       }),
                //       CommonText(
                //         text: 'I agree all terms & condition',
                //         fontSize: Constant.width * .04,
                //       )
                //     ],
                //   ),
                // ),

                SizedBox(height: Constant.height * .03),

                /// Create Account
                Obx(() {
                  return CommonButton(
                    title: 'Create Account',
                    onTap: () {
                      // function for Create Account
                      signUpVM.signup();
                    },
                    height: Constant.height * .06,
                    isLoading: signUpVM.loading.value,
                  );
                }),

                /// Already Have An Account ? Login
                Row(
                  children: [
                    /// Text
                    CommonText(
                      text: 'Already have an account ?',
                      fontSize: Constant.width * .035,
                    ),

                    /// Login Button
                    CommonTextButton(
                      onTap: () {
                        // function for Forgot Password
                        Get.offAll(() => const LoginScreen());
                      },
                      text: 'Login',
                      fontSize: Constant.width * .04,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}