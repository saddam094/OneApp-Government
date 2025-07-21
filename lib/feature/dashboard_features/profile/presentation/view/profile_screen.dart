import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/dashboard_features/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:one_app/feature/dashboard_features/profile/presentation/controller/profile_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final userProfileVM = Get.put(ProfileController());

  // Reusable widget for profile info
  Widget profileInfoTile({
    required String label,
    required String value,
    required int maxLine,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: Constant.width * .03,
        right: Constant.width * .03,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
          Container(
            width: Constant.width * 1,
            height: Constant.height * .06 * maxLine,
            margin: EdgeInsets.only(
              top: Constant.height * .004
            ),
            padding: EdgeInsets.only(
                left: Constant.width * .02,
                right: Constant.width * .02,
              top: Constant.height * .012
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(Constant.width * .02),
            ),
            child: Text(
              value,
              style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor),maxLines: maxLine,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileVM.userProfile();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context: context, title: 'Profile', backButton: true, onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.white,
      body: Obx(() {
        switch (userProfileVM.rxRequestStatusUserProfile.value) {
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
            var data = userProfileVM.rxUserProfileModel.value!;
            return Container(
              height: Constant.height * 1,
              width: Constant.width * 1,
              child: Column(
                children: [
                  /// Edit Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        height: Constant.height * .05,
                        width: Constant.width * .25,
                        margin: EdgeInsets.only(
                            right: Constant.width * .03,
                            top: Constant.height * .01
                        ),
                        title: 'Edit',
                        onTap: () {
                          Get.to(() => EditProfileScreen());
                        },
                      )
                    ],
                  ),


                  /// Profile Container
                  Container(
                    height: Constant.height * .2,
                    width: Constant.width * .45,
                    margin: EdgeInsets.only(
                        top: Constant.height * .03
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.eComCardBg,
                        borderRadius: BorderRadius.circular(Constant.width * .5),
                        border: Border.all(
                            color: AppColors.primaryColor
                        ),
                    ),
                    child: Center(
                      child: Icon(Icons.person, size: Constant.width * .25),
                    ),
                  ),

                  SizedBox(
                    height: Constant.height * .01,
                  ),

                  /// Name
                  profileInfoTile(label: 'Name', value: data.name, maxLine: 1),
                  profileInfoTile(label: 'Phone', value: data.phoneNumber, maxLine: 1),
                  profileInfoTile(label: 'Email', value: data.email, maxLine: 1),
                  profileInfoTile(label: 'Address', value: data.address, maxLine: 2),
                ],
              ),
            );
        }
      }),

      
    );
  }
}
