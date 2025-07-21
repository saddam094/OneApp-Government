import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/dashboard_features/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:one_app/feature/dashboard_features/profile/presentation/controller/profile_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:one_app/res/utils/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final editUserProfileVM = Get.put(EditProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editUserProfileVM.userProfile();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context: context, title: 'Edit Profile', backButton: true, onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.white,
      body: Obx(() {
        switch (editUserProfileVM.rxRequestStatusUserProfile.value) {
          case Status.LOADING:
            return Container(
              height: Constant.height * .91,
              width: Constant.width * 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case Status.ERROR:
            return Container(
              height: Constant.height * .91,
              width: Constant.width * 1,
              child: Center(
                child: Text('Something Went Wrong...',
                    style: TextStyle(
                        fontSize: Constant.width * .05,
                        color: AppColors.redColor)),
              ),
            );

          case Status.COMPLETED:
            // var data = editUserProfileVM.rxUserProfileModel.value!;
            return Container(
              height: Constant.height * 1,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                left: Constant.width * .03,
                right: Constant.width * .03,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Name', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// Name ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.nameController.value,
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
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Phone', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// Phone Number ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.phoneController.value,
                        hintText: 'Phone',
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
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Age', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// age ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.ageController.value,
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
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Height', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// height ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.heightController.value,
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
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Weight', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// weight ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.weightController.value,
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
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('Blood Group', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// Blood Group ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.bloodGroupController.value,
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
                
                
                      SizedBox(height: Constant.height * .01),
                
                      Row(
                        children: [
                          Text('About', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),
                
                      /// About ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.aboutController.value,
                        hintText: 'About (Optional)',
                        hintStyle: TextStyle(
                            fontSize: Constant.width * .04,
                            color: AppColors.greyTextDarkColor),
                        icon: Icon(Icons.person_2_outlined,
                            color: AppColors.greyTextDarkColor),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if(value!.isEmpty){
                            Utils.toastMessageTop('Enter About');
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: Constant.height * .01),

                      Row(
                        children: [
                          Text('Address', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black)),
                        ],
                      ),

                      /// About ---> It will be TextField
                      CommonTextField(
                        obSecure: false,
                        controller: editUserProfileVM.addressController.value,
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
                
                      SizedBox(height: Constant.height * .01),
                
                      /// Create Account
                      Obx(() {
                        return CommonButton(
                          title: 'Update Profile',
                          onTap: () {
                            // function for Create Account
                            editUserProfileVM.editUserProfile();
                          },
                          height: Constant.height * .06,
                          isLoading: editUserProfileVM.loading.value,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
        }
      }),

      
    );
  }
}
