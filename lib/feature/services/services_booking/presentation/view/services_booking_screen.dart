import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_service_man_profile/presentation/view/particular_service_man_profile_screen.dart';
import 'package:one_app/feature/services/services_booking/presentation/controller/service_man_booking_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ServicesBookingScreen extends StatefulWidget {
  const ServicesBookingScreen({super.key});

  @override
  State<ServicesBookingScreen> createState() => _ServicesBookingScreenState();
}

class _ServicesBookingScreenState extends State<ServicesBookingScreen> {

  final BSMListVM = Get.put(ServiceManBookingController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BSMListVM.bookedServiceManList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constant.height * .92,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Heading Text
              SizedBox(
                  height: Constant.height * .11,
                  width: Constant.width * 1,
                  child: Center(child: Text('Booked Appointment', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.servicesGradient2))),
              ),

              Container(
                height: Constant.height * .91,
                width: Constant.width * 1,
                child: ListView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.only(
                    top: Constant.height * .01,
                  ),
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

              // Container(
              //   height: Constant.height * .75,
              //   width: Constant.width * 1,
              //   child: Center(
              //     child: Text('No Service Man Booked ',
              //         style: TextStyle(
              //             fontSize: Constant.width * .05,
              //             color: AppColors.redColor)),
              //   ),
              // )

              /// Booked Appointment doctor list
              // Obx(() {
              //   switch (BSMListVM.rxRequestStatusBSMList.value) {
              //     case Status.LOADING:
              //       return Container(
              //         height: Constant.height * .2,
              //         width: Constant.width * 1,
              //         child: Center(
              //           child: CircularProgressIndicator(),
              //         ),
              //       );
              //
              //     case Status.ERROR:
              //       return Container(
              //         height: Constant.height * .2,
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
              //       if (BSMListVM.rxBSMListModel.value!.bookedServiceMen.isEmpty) {
              //         return Container(
              //           height: Constant.height * .2,
              //           width: Constant.width * 1,
              //           child: Center(
              //             child: Text('Booked Service Man List Is Empty',
              //                 style: TextStyle(
              //                     fontSize: Constant.width * .05,
              //                     color: AppColors.redColor)),
              //           ),
              //         );
              //       }
              //
              //       return Container(
              //         height:
              //         Constant.height * .14 * BSMListVM.rxBSMListModel.value!.bookedServiceMen.length,
              //         width: Constant.width * 1,
              //         child: ListView.builder(
              //           itemCount: BSMListVM.rxBSMListModel.value!.bookedServiceMen.length,
              //           physics: const NeverScrollableScrollPhysics(),
              //           padding: EdgeInsets.only(top: Constant.width * .005),
              //           itemBuilder: (context, index) {
              //             var data = BSMListVM.rxBSMListModel.value!.bookedServiceMen[index];
              //             return serviceManCard(
              //                 data.name,
              //                 data.category,
              //                 data.rating,
              //                 '50',
              //                 data.fee,
              //                 // data.image,
              //                 'assets/images/male services person.png',
              //                 data.bookingDate,
              //                 data.serviceManId);
              //           },
              //         ),
              //       );
              //   }
              // }),

            ],
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }

  /// Service Man Card For List
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
                        height: Constant.height * .025,
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

                      // /// Icon
                      // Icon(Icons.bookmark,
                      //     size: Constant.width * .07,
                      //     color: AppColors.servicesGradient1)
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
                        child: Text(address,
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
