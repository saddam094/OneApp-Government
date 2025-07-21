import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/cancel_doctor_appointment/presentation/view/cancel_doctor_appointment_screen.dart';
import 'package:one_app/feature/doctor/doctor_booking/presentation/controller/doctor_booking_controller.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/presentation/view/particular_doctor_detail_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/constant/constant_data.dart';


class DoctorBookingScreen extends StatefulWidget {
  const DoctorBookingScreen({super.key});

  @override
  State<DoctorBookingScreen> createState() => _DoctorBookingScreenState();
}

class _DoctorBookingScreenState extends State<DoctorBookingScreen> {

  final doctorBookedListVM = Get.put(DoctorBookingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorBookedListVM.bookedDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                  height: Constant.height * .1,
                  width: Constant.width * 1,
                  child: Center(child: Text('Appointment', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.doctorGradient3))),
              ),


              /// Booked Appointment doctor list
              Obx(() {
                switch (doctorBookedListVM.rxRequestStatusDoctorBookingList.value) {
                  case Status.LOADING:
                    return Container(
                      height: Constant.height * .8,
                      width: Constant.width * 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case Status.ERROR:
                    return Container(
                      height: Constant.height * .8,
                      width: Constant.width * 1,
                      child: Center(
                        child: Text(doctorBookedListVM.message.value == '' ? 'Something Went Wrong...' : doctorBookedListVM.message.value,
                            style: TextStyle(
                                fontSize: Constant.width * .05,
                                color: AppColors.redColor)),
                      ),
                    );

                  case Status.COMPLETED:
                    return Container(
                      height: Constant.height * .167 * doctorBookedListVM.rxDoctorBookingListModel.value!.body.length + Constant.height * .02,
                      width: Constant.width * 1,
                      child: ListView.builder(
                        itemCount: doctorBookedListVM.rxDoctorBookingListModel.value!.body.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            top: Constant.width * .02
                        ),
                        itemBuilder: (context, index) {
                          var data = doctorBookedListVM.rxDoctorBookingListModel.value!.body[index];
                          return doctorCard(data.name, data.specialist, data.rating, data.fee, data.image, data.appointmentDate, data.doctorId, data.appointmentDate, data.appointedTime);
                        },
                      ),
                    );
                }
              }),

              SizedBox(height: Constant.height * .02)

            ],
          ),
        ),
      )
    );
  }

  /// Doctor Card ---> Doctor Details
  Widget doctorCard(String name, specialist, rating, fees, imagePath, date, doctorId, appointedDate, appointedTime){
    return InkWell(
      onTap: () {
        Get.to(() => ParticularDoctorDetailScreen(doctorId: doctorId,));
      },
      child: Container(
        height: Constant.height * .165,
        width: Constant.width * 1,
        margin: EdgeInsets.only(
          left: Constant.width * .01,
          right: Constant.width * .01,
          bottom: Constant.height * .01
        ),
        padding: EdgeInsets.only(
          left: Constant.width * .01
        ),
        decoration: BoxDecoration(
          // color: AppColors.eComCardBg,
          borderRadius: BorderRadius.circular(Constant.width * .05),
          border: Border.all(
            color: AppColors.doctorGradient1,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Profile
            Container(
              height: Constant.height * .15,
              width: Constant.width * .3,
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
              height: Constant.height * .15,
              width: Constant.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Name
                  Text(name,
                      style: TextStyle(
                          fontSize: Constant.width * .035,
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
                              fontSize: Constant.width * .035,
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
                      Text(toTitleCase('Korrah Chowk Hazaribagh'),
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

                  /// Appointment Date and Cancel Button
                  Row(
                    children: [
                      Container(
                        width: Constant.width * .42,
                        child: Text('Appointed on - ${appointedDate}', style: TextStyle(fontSize: Constant.width * .032, color: AppColors.doctorGradient3))),

                      /// Cancel Button
                      InkWell(
                        onTap: () {
                          Get.to(() => CancelDoctorAppointmentScreen(doctorId:doctorId, appointedDate: appointedDate, appointedTime: appointedTime));
                        },
                        child: Container(
                          height: Constant.height * .03,
                          width: Constant.width * .17,
                          decoration: BoxDecoration(
                            color: AppColors.doctorGradient1,
                            borderRadius: BorderRadius.circular(Constant.width * .05),
                          ),
                          child: Center(
                            child: Text('Cancel', style: TextStyle(fontSize: Constant.width * .035, color: AppColors.white)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),



            /// Fees and Book now Button
            // Container(
            //   height: Constant.height * .14,
            //   width: Constant.width * .2,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       /// Fees
            //       SizedBox(),
            //
            //       /// Cancel Button
            //       CommonTextButton(
            //         text: 'Cancel',
            //         style: TextStyle(fontSize: Constant.width * .04, color: AppColors.redColor),
            //         onTap: () {
            //             Get.to(() => CancelDoctorAppointmentScreen(doctorId:doctorId, appointedDate: appointedDate, appointedTime: appointedTime));
            //         },
            //       )
            //     ],
            //   ),
            // )
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
