import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_service_man_profile/presentation/view/particular_service_man_profile_screen.dart';
import 'package:one_app/feature/services/particular_services_category/presentation/view/particular_services_category_screen.dart';
import 'package:one_app/feature/services/services_dashboard/presentation/controller/services_dashboard_controller.dart';
import 'package:one_app/feature/services/services_home/presentation/controller/service_home_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ServicesHomeScreen extends StatefulWidget {
  const ServicesHomeScreen({super.key});

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  final DSVM = Get.put(ServicesDashboardController());

  final serviceCategoryVM = Get.put(ServiceHomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // serviceCategoryVM.serviceCategoryList();
    // serviceCategoryVM.recommendedServiceManList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constant.height * .91,
        width: Constant.width * 1,
        child: Stack(
          children: [
            /// Main Content
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Constant.height * .23),

                  /// All Category and View All Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Text ---> "Find Your Doctor"
                      Text('All Category',
                          style: TextStyle(
                              fontSize: Constant.width * .045,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black)),

                      /// TextButton ---> "View All"
                      CommonTextButton(
                        onTap: () {
                          // Get.to(() => const FindYourDoctorScreen());
                          DSVM.currentIndex.value = 2;
                        },
                        text: 'View All',
                        style: TextStyle(
                            fontSize: Constant.width * .04,
                            fontWeight: FontWeight.bold,
                            color: AppColors.servicesGradient1,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.servicesGradient1),
                      )
                    ],
                  ),

                  /// Services Category
                  Container(
                    height: Constant.height * .16,
                    width: Constant.width * 1,
                    child: ListView.builder(
                      itemCount: serviceCategoryVM.categoryList.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data = serviceCategoryVM.categoryList[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => ParticularServicesCategoryScreen(
                                category: data['title'].toString()));
                          },
                          child: Container(
                            height: Constant.height * .12,
                            width: Constant.width * .22,
                            margin: EdgeInsets.only(
                              left: Constant.width * .01,
                              right: Constant.width * .01,
                              top: Constant.height * .005,
                              bottom: Constant.height * .005,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                /// Image Container
                                Container(
                                  height: Constant.height * .1,
                                  width: Constant.width * .2,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(
                                        Constant.width * .02),
                                    border: Border.all(
                                        color: AppColors.servicesGradient1
                                    ),

                                  ),
                                  child: Center(
                                    child: Container(
                                      height: Constant.height * .05,
                                      width: Constant.width * .12,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(data['image'].toString()),
                                            //   image: NetworkImage(data.imageUrl),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: Constant.height * .01),

                                /// Text ---> Doctor Categories
                                Text(data['title'].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: Constant.width * .03,
                                        color: AppColors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Obx(() {
                  //   switch (serviceCategoryVM
                  //       .rxRequestStatusServiceCategory.value) {
                  //     case Status.LOADING:
                  //       return Container(
                  //         height: Constant.height * .165,
                  //         width: Constant.width * 1,
                  //         child: Center(
                  //           child: CircularProgressIndicator(),
                  //         ),
                  //       );
                  //
                  //     case Status.ERROR:
                  //       return Container(
                  //         height: Constant.height * .165,
                  //         width: Constant.width * 1,
                  //         child: Center(
                  //           child: Text('Something Went Wrong...',
                  //               style: TextStyle(
                  //                   fontSize: Constant.width * .05,
                  //                   color: AppColors.redColor)),
                  //         ),
                  //       );
                  //
                  //     case Status.COMPLETED:
                  //       if (serviceCategoryVM
                  //           .rxServiceCategoryModel.value!.categories.isEmpty) {
                  //         return Container(
                  //           height: Constant.height * .165,
                  //           width: Constant.width * 1,
                  //           child: Center(
                  //             child: Text('Service Man List Is Empty',
                  //                 style: TextStyle(
                  //                     fontSize: Constant.width * .05,
                  //                     color: AppColors.redColor)),
                  //           ),
                  //         );
                  //       }
                  //
                  //       return Container(
                  //         height: Constant.height * .165,
                  //         width: Constant.width * 1,
                  //         child: ListView.builder(
                  //           itemCount: serviceCategoryVM.rxServiceCategoryModel
                  //               .value!.categories.length,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             var data = serviceCategoryVM
                  //                 .rxServiceCategoryModel
                  //                 .value!
                  //                 .categories[index];
                  //             return InkWell(
                  //               onTap: () {
                  //                 Get.to(() => ParticularServicesCategoryScreen(
                  //                     category: data.categoryName));
                  //               },
                  //               child: Container(
                  //                 height: Constant.height * .12,
                  //                 width: Constant.width * .22,
                  //                 margin: EdgeInsets.only(
                  //                   left: Constant.width * .01,
                  //                   right: Constant.width * .01,
                  //                   top: Constant.height * .005,
                  //                   bottom: Constant.height * .005,
                  //                 ),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     /// Image Container
                  //                     Container(
                  //                       height: Constant.height * .1,
                  //                       width: Constant.width * .2,
                  //                       decoration: BoxDecoration(
                  //                         color: AppColors.eComCardBg,
                  //                         borderRadius: BorderRadius.circular(
                  //                             Constant.width * .02),
                  //                         border: Border.all(
                  //                             color: AppColors.white,
                  //                             width: Constant.width * .004),
                  //                         image: DecorationImage(
                  //                             // image: AssetImage('assets/images/plumbing_services.png'),
                  //                             image:
                  //                                 NetworkImage(data.imageUrl),
                  //                             fit: BoxFit.fill),
                  //                       ),
                  //                     ),
                  //
                  //                     SizedBox(height: Constant.height * .01),
                  //
                  //                     /// Text ---> Doctor Categories
                  //                     Text(data.categoryName,
                  //                         style: TextStyle(
                  //                             fontSize: Constant.width * .03,
                  //                             color: AppColors.black),
                  //                         maxLines: 2,
                  //                         overflow: TextOverflow.ellipsis),
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       );
                  //   }
                  // }),

                  SizedBox(height: Constant.height * .01),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Text ---> "Find Your Doctor"
                      Text('Popular Services',
                          style: TextStyle(
                              fontSize: Constant.width * .045,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black)),

                      /// TextButton ---> "View All"
                      CommonTextButton(
                        onTap: () {},
                        text: 'View All',
                        style: TextStyle(
                            fontSize: Constant.width * .04,
                            fontWeight: FontWeight.bold,
                            color: AppColors.servicesGradient1,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.servicesGradient1),
                      )
                    ],
                  ),

                  Container(
                    height: Constant.height * .192,
                    width: Constant.width * 1,
                    padding: EdgeInsets.only(
                        left: Constant.width * .03,
                        right: Constant.width * .03),
                    child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Constant.width * .5,
                          margin: EdgeInsets.only(
                            right: Constant.width * .05,
                          ),
                          padding: EdgeInsets.only(
                              left: Constant.width * .02,
                              right: Constant.width * .02,
                              top: Constant.height * .01),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.circular(Constant.width * .04),
                              border: Border.all(
                                  color: AppColors.servicesGradient1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Image Container
                              Container(
                                height: Constant.height * .12,
                                width: Constant.width * 1,
                                decoration: BoxDecoration(
                                  color: AppColors.cardBG,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/services/tutor.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(
                                      Constant.width * .025),
                                ),
                              ),

                              SizedBox(height: Constant.height * .006),

                              /// Service Title
                              Text(toTitleCase('English Tutor'),
                                  style: TextStyle(
                                      fontSize: Constant.width * .035,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                  maxLines: 1),

                              /// Name
                              Row(
                                children: [
                                  Icon(Icons.person,
                                      size: Constant.width * .045,
                                      color: AppColors.servicesGradient1),
                                  Text(toTitleCase(' Ms Suman'),
                                      style: TextStyle(
                                          fontSize: Constant.width * .035,
                                          color: AppColors.greyTextLightColor),
                                      maxLines: 1),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: Constant.height * .01),

                  /// Recommended and View All Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Text ---> "Find Your Doctor"
                      Text('Recommended',
                          style: TextStyle(
                              fontSize: Constant.width * .045,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black)),
                    ],
                  ),

                  /// Recommended
                  Container(
                    height: Constant.height *
                        .14 * 5,
                    width: Constant.width * 1,
                    child: ListView.builder(
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                          left: Constant.width * .03,
                          right: Constant.width * .03,
                          top: Constant.height * .01),
                      itemBuilder: (context, index) {
                        return serviceManCard(
                            'Ms Suman',
                            'Online Tutoring',
                            '0.0',
                            '0',
                            '500',
                            'assets/images/male services person.png',
                            'Korrah Chowk Hazaribagh',
                            'id1234'
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// Heading Container
            Container(
              height: Constant.height * .23,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                  left: Constant.width * .03,
                  right: Constant.width * .03,
                  top: Constant.height * .05),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.servicesGradient2,
                      AppColors.servicesGradient1,
                    ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Constant.width * .05),
                    bottomRight: Radius.circular(Constant.width * .05),
                  )),
              child: Column(
                children: [
                  /// Current Location and Notification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Current Location ---> Text
                      SizedBox(
                        height: Constant.height * .06,
                        width: Constant.width * .7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Current Location',
                                style: TextStyle(
                                    fontSize: Constant.width * .04,
                                    color: AppColors.greyTextLightColor)),
                            Row(
                              children: [
                                Icon(Icons.place,
                                    size: Constant.width * .04,
                                    color: AppColors.white),
                                Text(' Markham Collage',
                                    style: TextStyle(
                                        fontSize: Constant.width * .04,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Notification
                      Stack(
                        children: [
                          /// Notification Icon
                          Container(
                            height: Constant.height * .05,
                            width: Constant.width * .1,
                            decoration: BoxDecoration(
                              color: AppColors.servicesGradient1,
                              borderRadius:
                                  BorderRadius.circular(Constant.width * .02),
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: Constant.width * .06,
                              color: AppColors.white,
                            ),
                          ),

                          /// number of notification
                          Container(
                            height: Constant.height * .025,
                            width: Constant.width * .05,
                            margin: EdgeInsets.only(
                              left: Constant.width * .07,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.servicesGradient2,
                                borderRadius:
                                    BorderRadius.circular(Constant.width * .1)),
                            child: Center(
                                child: Text('4',
                                    style: TextStyle(
                                        fontSize: Constant.width * .035,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white))),
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: Constant.height * .03),

                  ///Search and Filter button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Search Box
                      Container(
                        height: Constant.height * .06,
                        width: Constant.width * .8,
                        decoration: BoxDecoration(
                          color: AppColors.cardBG,
                          borderRadius:
                              BorderRadius.circular(Constant.width * .04),
                        ),
                        child: CommonTextField(
                          obSecure: false,
                          hintText: 'Search Services...',
                          icon: Icon(
                            Icons.search,
                            color: AppColors.greyTextDarkColor,
                          ),
                          hintStyle:
                              TextStyle(color: AppColors.greyTextDarkColor),
                        ),
                      ),

                      /// Filter Button
                      InkWell(
                        onTap: () {
                          // filter function
                        },
                        child: Container(
                          height: Constant.height * .06,
                          width: Constant.width * .12,
                          decoration: BoxDecoration(
                              color: AppColors.cardBG,
                              borderRadius:
                                  BorderRadius.circular(Constant.width * .02)),
                          child: Icon(
                            Icons.filter_alt,
                            size: Constant.width * .08,
                            color: AppColors.servicesGradient1,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }

  /// ServiceMan Card for list ---> Doctor Details
  Widget serviceManCard(String name, specialist, rating, reviews, fees,
      imagePath, address, serviceManId) {
    return InkWell(
      onTap: () {
        Get.to(() => ParticularServiceManProfileScreen(
              serviceManId: serviceManId,
              isBooked: false,
            ));
      },
      child: Container(
        height: Constant.height * .13,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        margin: EdgeInsets.only(
          bottom: Constant.height * .01,
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Constant.width * .03),
            border: Border.all(color: AppColors.servicesGradient1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Profile
            Container(
              height: Constant.height * .11,
              width: Constant.width * .24,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/services/tutor.png'),
                    // image: NetworkImage(imagePath),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(Constant.width * .03),
              ),
            ),

            /// content
            Container(
              height: Constant.height * .125,
              width: Constant.width * .65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Constant.height * .028,
                        width: Constant.width * .35,
                        decoration: BoxDecoration(
                          color: AppColors.servicesGradient3,
                          borderRadius:
                              BorderRadius.circular(Constant.width * .04),
                        ),
                        child: Center(
                          child: Text(toTitleCase(specialist),
                              style: TextStyle(
                                  fontSize: Constant.width * .035,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.servicesGradient1),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),

                      /// Icon
                      Icon(Icons.bookmark,
                          size: Constant.width * .06,
                          color: AppColors.servicesGradient1)
                    ],
                  ),

                  /// Service Title
                  Text(toTitleCase(' ${specialist} Wala'),
                      style: TextStyle(
                          fontSize: Constant.width * .035,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),

                  /// Specialist
                  Row(
                    children: [
                      Icon(Icons.person,
                          size: Constant.width * .04,
                          color: AppColors.servicesGradient1),
                      SizedBox(
                        width: Constant.width * .6,
                        child: Text(toTitleCase(' ${name}'),
                            style: TextStyle(
                                fontSize: Constant.width * .035,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyTextDarkColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),

                  /// Address
                  Row(
                    children: [
                      Icon(Icons.place,
                          size: Constant.width * .04,
                          color: AppColors.servicesGradient1),
                      SizedBox(
                        width: Constant.width * .6,
                        child: Text(toTitleCase(address),
                            style: TextStyle(
                                fontSize: Constant.width * .035,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyTextDarkColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
