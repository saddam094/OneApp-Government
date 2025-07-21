import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/p5/enquiry_now/presentation/controller/enquiry_now_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:one_app/res/utils/utils.dart';

class EnquiryNow extends StatefulWidget {
  const EnquiryNow({super.key});

  @override
  State<EnquiryNow> createState() => _EnquiryNowState();
}

class _EnquiryNowState extends State<EnquiryNow> {

  final enquiryVM = Get.put(EnquiryNowController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: Constant.height * 1,
            width: Constant.width * 1,
            child: Column(
              children: [
                /// Heading Container
                Container(
                  height: Constant.height * .15,
                  width: Constant.width * 1,
                  decoration: BoxDecoration(
                      color: AppColors.headColor1,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Constant.width * .05),
                        bottomRight: Radius.circular(Constant.width * .05),
                      )),
                  child: Center(
                    child: Text(
                      'ENQUIRY NOW',
                      style: TextStyle(
                          fontSize: Constant.width * .06,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                  ),
                ),

                /// Main Content
                Container(
                  height: Constant.height * .85,
                  width: Constant.width * 1,
                  padding: EdgeInsets.only(
                      left: Constant.width * .03,
                      right: Constant.width * .03,
                      top: Constant.height * .015
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// Name ---> It will be TextField
                          CommonTextField(
                            obSecure: false,
                            controller: enquiryVM.nameController.value,
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

                          SizedBox(height: Constant.height * .017),

                          /// Email ---> It will be TextField
                          CommonTextField(
                            obSecure: false,
                            controller: enquiryVM.emailController.value,
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

                          SizedBox(height: Constant.height * .017),

                          /// Phone Number ---> It will be TextField
                          CommonTextField(
                            obSecure: false,
                            controller: enquiryVM.phoneController.value,
                            hintText: 'Mobile Number',
                            maxLength: 10,
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

                          // SizedBox(height: Constant.height * .015),

                          /// age ---> It will be TextField
                          CommonTextField(
                            obSecure: false,
                            controller: enquiryVM.requirementController.value,
                            hintText: 'Your Requirement',
                            maxLength: 1000,
                            hintStyle: TextStyle(
                                fontSize: Constant.width * .04,
                                color: AppColors.greyTextDarkColor),
                            icon: Icon(Icons.description_outlined,
                                color: AppColors.greyTextDarkColor),
                            validator: (value) {
                              if(value!.isEmpty){
                                Utils.toastMessageTop('Enter Requirement');
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: Constant.height * .38),

                          /// Create Account
                          Obx(() {
                            return CommonButton(
                              title: 'Submit',
                              onTap: () {
                                enquiryVM.enquiryNow();
                              },
                              height: Constant.height * .06,
                              isLoading: enquiryVM.loading.value,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Back Button (Top Left)
          Positioned(
            top: Constant.height * .05,
            left: Constant.width * .04,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: Constant.width  *.07),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        // child:
      ),
      backgroundColor: AppColors.white,
    );
  }
}
