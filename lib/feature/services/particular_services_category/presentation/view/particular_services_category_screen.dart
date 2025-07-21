import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_service_man_profile/presentation/view/particular_service_man_profile_screen.dart';
import 'package:one_app/feature/services/particular_services_category/presentation/controller/particular_category_service_man_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/constant/constant_data.dart';


class ParticularServicesCategoryScreen extends StatefulWidget {
  final String category;
  const ParticularServicesCategoryScreen({super.key, required this.category});

  @override
  State<ParticularServicesCategoryScreen> createState() => _ParticularServicesCategoryScreenState();
}

class _ParticularServicesCategoryScreenState extends State<ParticularServicesCategoryScreen> {

  final PCSMListVM = Get.put(ParticularCategoryServiceManController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PCSMListVM.particularCategoryServiceManList(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context: context, title: widget.category, backButton: true, onBackTap: () => Navigator.pop(context)),
     body: Container(
       height: Constant.height * .9,
       width: Constant.width * 1,
       child: ListView.builder(
         itemCount: 4,
         padding: EdgeInsets.only(
           top: Constant.height * .01,
           left: Constant.width * .02,
           right: Constant.width * .02,
         ),
         itemExtent: Constant.height * .15,
         itemBuilder: (context, index) {
           return serviceManCard(
               'Ms Suman',
               widget.category,
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

      // body: Obx(() {
      //   switch (PCSMListVM.rxRequestStatusPCSML.value) {
      //     case Status.LOADING:
      //       return Container(
      //         height: Constant.height * .88,
      //         width: Constant.width * 1,
      //         child: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //
      //     case Status.ERROR:
      //       return Container(
      //         height: Constant.height * .88,
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
      //       if (PCSMListVM.rxPCSMLModel.value!.body.isEmpty) {
      //         return Container(
      //           height: Constant.height * .88,
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
      //         height: Constant.height * .9,
      //         width: Constant.width * 1,
      //         child: ListView.builder(
      //           itemCount: PCSMListVM.rxPCSMLModel.value!.body.length,
      //           padding: EdgeInsets.only(
      //             top: Constant.height * .01,
      //             left: Constant.width * .02,
      //             right: Constant.width * .02,
      //           ),
      //           itemExtent: Constant.height * .15,
      //           itemBuilder: (context, index) {
      //             var data = PCSMListVM.rxPCSMLModel.value!.body[index];
      //             return serviceManCard(data.name, data.category, data.rating, data.reviewCount, '500', 'assets/images/male services person.png', data.address, data.serviceManId);
      //           },
      //         ),
      //       );
      //   }
      // }),
      backgroundColor: AppColors.white,
    );
  }

  /// Service Man Card For List
  Widget serviceManCard(String name, specialist, rating, reviews, fees,
      imagePath, address, serviceManId) {
    return InkWell(
      onTap: () {
        Get.to(() => ParticularServiceManProfileScreen(
          serviceManId: 'id1234',
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
                        child: Text(toTitleCase(' $address'),
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

  // /// Service Man Card For List
  // Widget serviceManCard(String name, specialist, rating, reviews, fees, imagePath, address, serviceManId){
  //   return InkWell(
  //     onTap: () {
  //       Get.to(() => ParticularServiceManProfileScreen(serviceManId: serviceManId, isBooked: false));
  //     },
  //     child: Container(
  //       height: Constant.height * .13,
  //       width: Constant.width * 1,
  //       padding: EdgeInsets.only(
  //         left: Constant.width * .01,
  //       ),
  //       margin: EdgeInsets.only(
  //         bottom: Constant.height * .01,
  //       ),
  //       decoration: BoxDecoration(
  //           color: AppColors.eComCardBg,
  //           borderRadius: BorderRadius.circular(Constant.width * .03),
  //         border: Border.all(color: AppColors.primaryColor),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           /// Profile
  //           Container(
  //             height: Constant.height * .12,
  //             width: Constant.width * .24,
  //             decoration: BoxDecoration(
  //               color: AppColors.white,
  //               image: DecorationImage(
  //                   image: AssetImage(imagePath)
  //               ),
  //               borderRadius: BorderRadius.circular(Constant.width * .03),
  //             ),
  //           ),
  //
  //           /// content
  //           Container(
  //             height: Constant.height * .125,
  //             width: Constant.width * .67,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 /// Name
  //                 Text(specialist, style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
  //
  //                 /// Specialist
  //                 Text(name, style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.w500, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis),
  //
  //                 /// Ratings
  //                 // Row(
  //                 //   children: [
  //                 //     /// Star
  //                 //     Icon(Icons.star, size: Constant.width * .05, color: AppColors.yellowColor,),
  //                 //
  //                 //     /// Text
  //                 //     Text(' ${rating} (${reviews} Reviews)', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.w500, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis),
  //                 //   ],
  //                 // ),
  //
  //                 /// Address
  //                 Text(address, style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.w500, color: AppColors.greyTextDarkColor),maxLines: 1, overflow: TextOverflow.ellipsis),
  //               ],
  //             ),
  //           ),
  //
  //           /// Fees and Book now Button
  //           // Container(
  //           //   height: Constant.height * .125,
  //           //   width: Constant.width * .12,
  //           //   child: Column(
  //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           //     children: [
  //           //       /// Save icon Button
  //           //       IconButton(
  //           //         icon: Icon(Icons.bookmark_border_outlined, size: Constant.width * .08, color: AppColors.primaryBlueColor),
  //           //         onPressed: () {
  //           //
  //           //         },
  //           //       ),
  //           //
  //           //       SizedBox()
  //           //     ],
  //           //   ),
  //           // )
  //         ],
  //       ),
  //     ),
  //   );
  // }


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
