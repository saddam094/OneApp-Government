import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/cancel_doctor_appointment/presentation/controller/cancel_appointment_controller.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/presentation/controller/particular_doctor_details_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:url_launcher/url_launcher_string.dart';


class CancelDoctorAppointmentScreen extends StatefulWidget {
  final String doctorId;
  final String appointedDate;
  final String appointedTime;
  const CancelDoctorAppointmentScreen({super.key, required this.doctorId, required this.appointedDate, required this.appointedTime});

  @override
  State<CancelDoctorAppointmentScreen> createState() => _CancelDoctorAppointmentScreenState();
}

class _CancelDoctorAppointmentScreenState extends State<CancelDoctorAppointmentScreen> {

  final doctorDetailsVM = Get.put(ParticularDoctorDetailsController());
  final cancelAppointmentVM = Get.put(CancelAppointmentController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorDetailsVM.particularDoctorDetails(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context: context,
          title: 'Appointed Doctor',
          backButton: true,
          onBackTap: () => Navigator.pop(context)),
      body: Container(
        height: Constant.height * .89,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        child: SingleChildScrollView(
          child: Obx(() {
            switch (doctorDetailsVM.rxRequestStatusPDDetails.value) {
              case Status.LOADING:
                return Container(
                  height: Constant.height * .89,
                  width: Constant.width * 1,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              case Status.ERROR:
                return Container(
                  height: Constant.height * .89,
                  width: Constant.width * 1,
                  child: Center(
                    child: Text('Something Went Wrong...',
                        style: TextStyle(
                            fontSize: Constant.width * .05,
                            color: AppColors.redColor)),
                  ),
                );

              case Status.COMPLETED:
              // if (homeVM
              //     .rxDoctorCategoryModel.value!.categories.isEmpty) {
              //   return Container(
              //     height: Constant.height * .15,
              //     width: Constant.width * 1,
              //     child: Center(
              //       child: Text('Doctor Category List Is Empty',
              //           style: TextStyle(
              //               fontSize: Constant.width * .05,
              //               color: AppColors.redColor)),
              //     ),
              //   );
              // }
                final data = doctorDetailsVM.rxPDDetailsModel.value!;
                return Column(
                  children: [
                    SizedBox(height: Constant.height * .01),

                    /// doctor profile
                    Container(
                      height: Constant.height * .12,
                      width: Constant.width * 1,
                      padding: EdgeInsets.only(
                        left: Constant.width * .02,
                        right: Constant.width * .02,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.cardBG,
                          borderRadius: BorderRadius.circular(Constant.width * .05),
                          border: Border.all(
                              color: AppColors.doctorGradient1
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Profile
                          Container(
                            height: Constant.height * .1,
                            width: Constant.width * .2,
                            decoration: BoxDecoration(
                                color: AppColors.eComCardBg,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/doctor/female doctor.png'),
                                    // image: NetworkImage(data.image),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(Constant.width * .04),
                                border: Border.all(
                                    color: AppColors.doctorGradient1
                                )
                            ),
                          ),

                          /// content
                          Container(
                            height: Constant.height * .11,
                            width: Constant.width * .55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /// Name
                                Text(data.name, style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),

                                /// Specialist
                                Row(
                                  children: [
                                    Icon(Icons.person, size: Constant.width * .05, color: AppColors.doctorGradient1),
                                    Text(data.specialist,
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
                                  height: Constant.height * .025,
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
                                      Text(' ${data.rating}',
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

                          /// Fees and Book now Button
                          SizedBox(
                            height: Constant.height * .1,
                            width: Constant.width * .12,
                            child: InkWell(
                              onTap: () {
                                var phone = doctorDetailsVM.rxPDDetailsModel.value!.phone;
                                launchUrlString('tel://$phone');
                              },
                              child: Icon(Icons.call, size: Constant.width * .08, color: AppColors.doctorGradient3),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Doctor Biography"
                    Row(
                      children: [
                        Text('Doctor Biography',
                            style: TextStyle(fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> Doctor Biography Content
                    Text(data.about, style: TextStyle(
                        fontSize: Constant.width * .04,
                        color: AppColors.greyTextDarkColor),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Schedules"
                    Row(
                      children: [
                        Text('Appointment Time',
                            style: TextStyle(fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Calender
                    Container(
                      height: Constant.height * .07,
                      width: Constant.width * 1,
                      decoration: BoxDecoration(
                        color: AppColors.cardBG,
                        borderRadius: BorderRadius.circular(
                            Constant.width * .02),
                        border: Border.all(
                          color: AppColors.doctorGradient1
                        )
                      ),
                      child: Center(
                        child: Text('${widget.appointedDate}     ${widget
                            .appointedTime}', style: TextStyle(
                            fontSize: Constant.width * .045,
                            fontWeight: FontWeight.w500,
                            color: AppColors.doctorGradient2),),
                      ),
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Description"
                    Row(
                      children: [
                        Text('Description', style: TextStyle(fontSize: Constant
                            .width * .045,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    CommonTextField(
                      obSecure: false,
                      hintText: 'Describe Your Health Issue',
                      hintStyle: TextStyle(fontSize: Constant.width * .04),
                      maxLength: 1000,
                    ),


                    SizedBox(height: Constant.height * .1),
                  ],
                );
            }
          }),
        ),
      ),
      backgroundColor: AppColors.white,
      floatingActionButton: Obx(() {
        return Padding(
          padding: EdgeInsets.only(
            left: Constant.width * .07,
          ),
          child: InkWell(
            onTap: () {

            },
            child: Container(
              height: Constant.height * .07,
              width: Constant.width * 1,
              child: Center(
                child: CommonButton(
                  isLoading: cancelAppointmentVM.isLoadingCancelAppointment
                      .value,
                  title: 'Cancel Appointment',
                  onTap: () {
                    cancelAppointmentVM.cancelAppointment(widget.doctorId);
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

}
