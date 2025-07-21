import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_more/presentation/controller/doctor_user_profile_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';

class DoctorMoreScreen extends StatefulWidget {
  const DoctorMoreScreen({super.key});

  @override
  State<DoctorMoreScreen> createState() => _DoctorMoreScreenState();
}

class _DoctorMoreScreenState extends State<DoctorMoreScreen> {

  final userProfileVM = Get.put(DoctorUserProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileVM.userProfile();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return Stack(
              children: [
                /// Main Container
                Container(
                  height:  Constant.height * .91,
                  width: Constant.width * 1,
                  padding: EdgeInsets.only(
                    top: Constant.height * .37,
                    left: Constant.width * .02,
                    right: Constant.width * .02,
                  ),
                  decoration: BoxDecoration(

                  ),
                  child: Column(
                    children: [
                      /// Text ---> Name
                      Text(toTitleCase(data.name), style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.black)),

                      SizedBox(height: Constant.height * .02),

                      /// details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /// height
                          card('Height', data.height, Icons.height),

                          /// Weight
                          card('Weight', '${data.weight} kg', Icons.monitor_weight_outlined),

                          /// Age
                          card('Age', data.age, Icons.person_outline),

                          /// Blood
                          card('Blood', data.bloodGroup, Icons.bloodtype),
                        ],
                      ),

                      SizedBox(height: Constant.height * .01),

                      /// Text ---> "Description"
                      Row(
                        children: [
                          Text('About', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.black)),
                          SizedBox()
                        ],
                      ),

                      SizedBox(height: Constant.height * .01),

                      Text(data.about, style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 5,overflow: TextOverflow.ellipsis),

                      SizedBox(height: Constant.height * .01),
                    ],
                  ),
                ),

                /// Heading Container
                Container(
                  height:  Constant.height * .25,
                  width: Constant.width * 1,
                  decoration: BoxDecoration(
                    // color: AppColors.primaryGreyColor
                    gradient: LinearGradient(
                      colors: [
                        AppColors.doctorGradient2,
                        AppColors.doctorGradient1
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: Constant.height * .06,
                        ),
                        child: Text('Profile', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.black),),
                      ),

                      SizedBox()
                    ],
                  ),
                ),

                /// Image Container
                Container(
                  height: Constant.height * .21,
                  width: Constant.width * .46,
                  margin: EdgeInsets.only(
                      top: Constant.height * .14,
                      left: Constant.width * .27
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.cardBG,
                      // image: DecorationImage(
                      //     image: AssetImage('assets/images/male doctor person.png'),
                      //     fit: BoxFit.fill
                      // ),
                      borderRadius: BorderRadius.circular(Constant.width * .5),
                    border: Border.all(
                      color: AppColors.doctorGradient3
                    )
                  ),
                  child: Center(
                    child: Icon(Icons.person, size: Constant.width * .3, color: AppColors.doctorGradient3),
                  ),
                )
              ],
            );
        }
      }),
    );
  }

  Widget card(String title, value, IconData icon){
    return Container(
      height: Constant.height * .156,
      width: Constant.width * .2,
      decoration: BoxDecoration(
        // color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(Constant.width * .02),
      ),
      padding: EdgeInsets.only(
        top: Constant.height * .01
      ),
      child: Column(
        children: [
          /// Icon Container
          Container(
            height: Constant.height * .08,
            width: Constant.width * .16,
            decoration: BoxDecoration(
              color: AppColors.eComCardBg,
              borderRadius: BorderRadius.circular(Constant.width * .2),
            ),
            child: Center(
              child: Icon(icon, size: Constant.width * .09, color: AppColors.primaryColor),
            ),
          ),

          /// Title ---> Text
          Text(title, style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.w500, color: AppColors.greyTextDarkColor)),

          /// Value ---> Text
          Text(value, style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.w500, color: AppColors.black)),

        ],
      ),
    );
  }

  String toTitleCase(String input) {
    return input
        .toLowerCase()
        .split(' ')
        .map((word) => word.isNotEmpty
        ? word[0].toUpperCase() + word.substring(1)
        : '')
        .join(' ');
  }
  
}
