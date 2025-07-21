import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/particular_category_doctor/presentation/controller/particular_category_doctor_list_controller.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/presentation/view/particular_doctor_detail_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/constant/constant_data.dart';


class ParticularCategoryDoctorsScreen extends StatefulWidget {
  final String specialist;
  const ParticularCategoryDoctorsScreen({super.key, required this.specialist});

  @override
  State<ParticularCategoryDoctorsScreen> createState() => _ParticularCategoryDoctorsScreenState();
}

class _ParticularCategoryDoctorsScreenState extends State<ParticularCategoryDoctorsScreen> {

  final PCDListVM = Get.put(ParticularCategoryDoctorListController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PCDListVM.particularCategoryDoctorsList(widget.specialist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context: context, title: widget.specialist, backButton: true, onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.eComCardBg,
      body: SingleChildScrollView(
        child: Obx(() {
          switch (PCDListVM.rxRequestStatusPCDList.value) {
            case Status.LOADING:
              return Container(
                height: Constant.height * .88,
                width: Constant.width * 1,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case Status.ERROR:
              return Container(
                height: Constant.height * .88,
                width: Constant.width * 1,
                child: Center(
                  child: Text('Something Went Wrong...',
                      style: TextStyle(
                          fontSize: Constant.width * .05,
                          color: AppColors.redColor)),
                ),
              );

            case Status.COMPLETED:
              if (PCDListVM.rxPCDListModel.value!.body.isEmpty) {
                return Container(
                  height: Constant.height * .88,
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
                height: Constant.height * .16 * PCDListVM.rxPCDListModel.value!.body.length,
                width: Constant.width * 1,
                padding: EdgeInsets.only(
                  left: Constant.width * .02,
                  right: Constant.width * .02,
                ),
                child: ListView.builder(
                  itemCount: PCDListVM.rxPCDListModel.value!.body.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                      top: Constant.width * .02
                  ),
                  itemBuilder: (context, index) {
                    var data = PCDListVM.rxPCDListModel.value!.body[index];
                    return doctorCard(data.name, data.specialist, data.rating, data.reviewsCount, data.fee, data.image, data.doctorId);
                  },
                ),
              );
          }
        }),
      ),
    );
  }

  /// doctor card
  Widget doctorCard(String name, specialist, rating, reviews, fees, imagePath, doctorId) {
    return InkWell(
      onTap: () {
        Get.to(() => ParticularDoctorDetailScreen(doctorId: doctorId));
      },
      child: Container(
        height: Constant.height * .15,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .025,
          right: Constant.width * .025,
        ),
        margin: EdgeInsets.only(
          bottom: Constant.height * .01,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBG,
          borderRadius: BorderRadius.circular(Constant.width * .05),
          border: Border.all(
            color: AppColors.doctorGradient1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Profile
            Container(
              height: Constant.height * .13,
              width: Constant.width * .26,
              decoration: BoxDecoration(
                color: AppColors.eComCardBg,
                border: Border.all(
                  color: AppColors.doctorGradient1
                ),
                image: DecorationImage(image: AssetImage('assets/images/doctor/female doctor.png'), fit: BoxFit.cover),
                // image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(Constant.width * .05),
              ),
            ),

            SizedBox(width: Constant.width * .02),

            /// content
            Container(
              height: Constant.height * .11,
              width: Constant.width * .62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Name
                  Text(toTitleCase(name),
                      style: TextStyle(
                          fontSize: Constant.width * .045,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),

                  /// Specialist
                  Row(
                    children: [
                      Icon(Icons.person, size: Constant.width * .05, color: AppColors.doctorGradient1),
                      Text(toTitleCase(specialist),
                          style: TextStyle(
                              fontSize: Constant.width * .04,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyTextDarkColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),

                  /// Address
                  Row(
                    children: [
                      Icon(Icons.place, size: Constant.width * .05, color: AppColors.doctorGradient1),
                      Text('Korrah Chowk Hazaribagh',
                          style: TextStyle(
                              fontSize: Constant.width * .035,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyTextLightColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),

                  /// Ratings
                  Container(
                    height: Constant.height * .03,
                    width: Constant.width * .18,
                    decoration: BoxDecoration(
                      color: AppColors.doctorGradient1,
                      borderRadius: BorderRadius.circular(Constant.width * .05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Star
                        Icon(
                          Icons.star,
                          size: Constant.width * .05,
                          color: AppColors.yellowColor,
                        ),

                        SizedBox(width: Constant.width * .005),

                        /// Text
                        Text(' ${rating}',
                            style: TextStyle(
                                fontSize: Constant.width * .04,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyTextDarkColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
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
