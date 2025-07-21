import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_dashboard/presentation/controller/doctor_dashboard_controller.dart';
import 'package:one_app/feature/doctor/doctor_home/presentation/controller/doctor_home_controller.dart';
import 'package:one_app/feature/doctor/particular_category_doctor/presentation/view/particular_category_doctors_screen.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/presentation/view/particular_doctor_detail_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  final DSVM = Get.put(DoctorDashboardController());

  final homeVM = Get.put(DoctorHomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.popularDoctorList();
    homeVM.doctorCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          height: Constant.height * 1,
          width: Constant.width * 1,
          child: Stack(
            children: [
              /// Main Content
              Container(
                height: Constant.height * .91,
                width: Constant.width * 1,
                padding: EdgeInsets.only(
                  top: Constant.height * .35,
                  left: Constant.width * .02,
                  right: Constant.width * .02,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Find Your Doctor
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Text ---> "Find Your Doctor"
                          Text('Categories',
                              style: TextStyle(
                                  fontSize: Constant.width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black)),

                          /// TextButton ---> "View All"
                          CommonTextButton(
                            onTap: () {
                              // Get.to(() => const FindYourDoctorScreen());
                              DSVM.currentIndex.value = 1;
                            },
                            text: 'View All',
                            style: TextStyle(
                                fontSize: Constant.width * .05,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          )
                        ],
                      ),

                      /// Doctor Categories
                      Obx(() {
                        switch (homeVM.rxRequestStatusDoctorCategory.value) {
                          case Status.LOADING:
                            return Container(
                              height: Constant.height * .15,
                              width: Constant.width * 1,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                          case Status.ERROR:
                            return Container(
                              height: Constant.height * .15,
                              width: Constant.width * 1,
                              child: Center(
                                child: Text('Something Went Wrong...',
                                    style: TextStyle(
                                        fontSize: Constant.width * .05,
                                        color: AppColors.redColor)),
                              ),
                            );

                          case Status.COMPLETED:
                            if (homeVM.rxDoctorCategoryModel.value!.categories
                                .isEmpty) {
                              return Container(
                                height: Constant.height * .15,
                                width: Constant.width * 1,
                                child: Center(
                                  child: Text('Doctor Category List Is Empty',
                                      style: TextStyle(
                                          fontSize: Constant.width * .05,
                                          color: AppColors.redColor)),
                                ),
                              );
                            }

                            return Container(
                              height: Constant.height * .12,
                              width: Constant.width * 1,
                              child: ListView.builder(
                                itemCount: homeVM.rxDoctorCategoryModel.value!
                                    .categories.length,
                                scrollDirection: Axis.horizontal,
                                itemExtent: Constant.width * .25,
                                itemBuilder: (context, index) {
                                  var data = homeVM.rxDoctorCategoryModel.value!
                                      .categories[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          ParticularCategoryDoctorsScreen(
                                              specialist: data.categoryName));
                                    },
                                    child: Container(
                                      height: Constant.height * .12,
                                      width: Constant.width * .22,
                                      // color: AppColors.primaryColor,
                                      margin: EdgeInsets.only(
                                        left: Constant.width * .01,
                                        right: Constant.width * .01,
                                        top: Constant.height * .005,
                                      ),
                                      padding: EdgeInsets.only(
                                          top: Constant.width * .015),
                                      decoration: BoxDecoration(
                                        color: AppColors.cardBG,
                                        borderRadius: BorderRadius.circular(
                                            Constant.width * .02),
                                        border: Border.all(
                                            color: AppColors.doctorGradient1,
                                            width: Constant.width * .004),
                                      ),
                                      // color: AppColors.greyTextLightColor,
                                      child: Column(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
                                        children: [
                                          /// Image Container
                                          Container(
                                            height: Constant.height * .08,
                                            width: Constant.width * .18,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Constant.width * .02),
                                              image: DecorationImage(
                                                  // image: AssetImage(listOfDoctorCategories[index]['imagePath']),
                                                  image: NetworkImage(
                                                      data.imageURL),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),

                                          /// Text ---> Doctor Categories
                                          Text(
                                            data.categoryName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Constant.width * .03,
                                                color: AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                        }
                      }),

                      SizedBox(height: Constant.height * .01),

                      /// Text ---> "Popular Doctors"
                      Row(
                        children: [
                          Text('Best Doctors',
                              style: TextStyle(
                                  fontSize: Constant.width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black)),
                          SizedBox()
                        ],
                      ),

                      /// Popular Doctors List
                      Obx(() {
                        switch (homeVM.rxRequestStatusPopularDoctor.value) {
                          case Status.LOADING:
                            return Container(
                              height: Constant.height * .1,
                              width: Constant.width * 1,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                          case Status.ERROR:
                            return Container(
                              height: Constant.height * .1,
                              width: Constant.width * 1,
                              child: Center(
                                child: Text('Something Went Wrong...',
                                    style: TextStyle(
                                        fontSize: Constant.width * .05,
                                        color: AppColors.redColor)),
                              ),
                            );

                          case Status.COMPLETED:
                            if (homeVM
                                .rxPopularDoctorModel.value!.doctors.isEmpty) {
                              return Container(
                                height: Constant.height * .1,
                                width: Constant.width * 1,
                                child: Center(
                                  child: Text('Doctor List Is Empty',
                                      style: TextStyle(
                                          fontSize: Constant.width * .05,
                                          color: AppColors.redColor)),
                                ),
                              );
                            }

                            return Container(
                              height: Constant.height *
                                  .24 *
                                  (homeVM.rxPopularDoctorModel.value!.doctors.length % 2 == 0 ? (homeVM.rxPopularDoctorModel.value!.doctors.length / 2) : ((homeVM.rxPopularDoctorModel.value!.doctors.length / 2) + 0.5)),
                              width: Constant.width * 1,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      crossAxisSpacing: Constant.width * .03,
                                      mainAxisSpacing: Constant.height * .015,
                                      mainAxisExtent: Constant.height * .23
                                    ),
                                itemCount: homeVM
                                    .rxPopularDoctorModel.value!.doctors.length,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    EdgeInsets.only(top: Constant.width * .02),
                                itemBuilder: (context, index) {
                                  var data = homeVM.rxPopularDoctorModel.value!
                                      .doctors[index];
                                  return doctorCard(
                                      data.name,
                                      data.specialist,
                                      data.rating,
                                      data.reviewsCount,
                                      data.fee,
                                      data.image,
                                      // 'assets/images/male doctor person.png',
                                      data.doctorId);
                                },
                              ),
                            );
                        }
                      }),

                      SizedBox(height: Constant.height * .02),
                    ],
                  ),
                ),
              ),

              /// Stack Heading Content
              Container(
                height: Constant.height * .35,
                width: Constant.width * 1,
                padding: EdgeInsets.only(
                    left: Constant.width * .02,
                    right: Constant.width * .02,
                    top: Constant.height * .05),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.doctorGradient2,
                        AppColors.doctorGradient1
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Constant.width * .05),
                      bottomRight: Radius.circular(Constant.width * .05),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Greeting and Notification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Greeting
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello Sam',
                                  style: TextStyle(
                                      fontSize: Constant.width * .04,
                                      color: AppColors.white)),
                              Text('How do you feel do?',
                                  style: TextStyle(
                                      fontSize: Constant.width * .045,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),

                        /// Notification icon
                        Stack(
                          children: [
                            /// Notification Icon
                            Container(
                              height: Constant.height * .06,
                              width: Constant.width * .12,
                              decoration: BoxDecoration(
                                color: AppColors.doctorGradient1,
                                // border: Border.all(
                                //   color: AppColors.white,
                                // ),
                                borderRadius:
                                    BorderRadius.circular(Constant.width * .03),
                              ),
                              child: Icon(
                                Icons.notifications,
                                size: Constant.width * .07,
                                color: AppColors.white,
                              ),
                            ),

                            /// number of notification
                            Container(
                              height: Constant.height * .03,
                              width: Constant.width * .06,
                              margin: EdgeInsets.only(
                                left: Constant.width * .08,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.doctorGradient3,
                                  borderRadius: BorderRadius.circular(
                                      Constant.width * .1)),
                              child: Center(
                                  child: Text('5',
                                      style: TextStyle(
                                          fontSize: Constant.width * .04,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white))),
                            )
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: Constant.height * .04),

                    /// Text ---> "Lets Find Your Top Doctor
                    Text('Let`s Find\nYour Top Doctor',
                        style: TextStyle(
                            fontSize: Constant.width * .06,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500)),

                    SizedBox(height: Constant.height * .02),

                    /// Search Box
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.eComCardBg,
                        borderRadius:
                            BorderRadius.circular(Constant.width * .025),
                      ),
                      child: CommonTextField(
                        obSecure: false,
                        hintText: 'Search Health Issue',
                        icon: Icon(
                          Icons.search,
                          color: AppColors.greyTextDarkColor,
                        ),
                        hintStyle:
                            TextStyle(color: AppColors.greyTextDarkColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  /// Doctor Card ---> Doctor Details
  Widget doctorCard(
      String name, specialist, rating, reviews, fees, imagePath, doctorId) {
    return InkWell(
        onTap: () {
          Get.to(() => ParticularDoctorDetailScreen(doctorId: doctorId));
        },
        child: Container(
          padding: EdgeInsets.only(
            left: Constant.width * .02,
            right: Constant.width * .02,
            top: Constant.height * .008,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardBG,
            borderRadius: BorderRadius.circular(Constant.width * .05),
            border: Border.all(
              color: AppColors.doctorGradient1
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Profile
                Container(
                  height: Constant.height * .15,
                  width: Constant.width * .45,
                  decoration: BoxDecoration(
                    color: AppColors.eComCardBg,
                    image: DecorationImage(image: AssetImage('assets/images/doctor/female doctor.png')),
                    // image: DecorationImage(image: NetworkImage(imagePath)),
                    borderRadius: BorderRadius.circular(Constant.width * .05),
                    border: Border.all(
                      color: AppColors.greyTextLightColor
                    )
                  ),
                ),

                SizedBox(height: Constant.height * .01),

                /// Name
                Text(toTitleCase(name),
                    style: TextStyle(
                        fontSize: Constant.width * .04,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),


                /// Specialist and Ratings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(toTitleCase(specialist),
                        style: TextStyle(
                            fontSize: Constant.width * .04,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyTextLightColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),

                    /// Ratings
                    Row(
                      children: [
                        /// Star
                        Icon(
                          Icons.star,
                          size: Constant.width * .045,
                          color: AppColors.yellowColor,
                        ),

                        /// Text
                        Text(' ${rating.toString()}',
                            style: TextStyle(
                                fontSize: Constant.width * .04,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyTextDarkColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),

                  ],
                ),

              ]),
        ));
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
