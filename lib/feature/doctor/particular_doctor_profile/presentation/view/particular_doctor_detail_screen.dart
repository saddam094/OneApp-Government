import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/particular_doctor_profile/presentation/controller/particular_doctor_details_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ParticularDoctorDetailScreen extends StatefulWidget {
  final String doctorId;
  const ParticularDoctorDetailScreen({super.key, required this.doctorId});

  @override
  State<ParticularDoctorDetailScreen> createState() =>
      _ParticularDoctorDetailScreenState();
}

class _ParticularDoctorDetailScreenState
    extends State<ParticularDoctorDetailScreen> {
  final PDDetailsVM = Get.put(ParticularDoctorDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PDDetailsVM.particularDoctorDetails(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          context: context,
          title: 'Doctor Profile',
          backButton: true,
          onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.white,
      body: Container(
        height: Constant.height * .89,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        child: SingleChildScrollView(
          child: Obx(() {
            switch (PDDetailsVM.rxRequestStatusPDDetails.value) {
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
                if (PDDetailsVM.rxPDDetailsModel.value == null) {
                  return Container(
                    height: Constant.height * .15,
                    width: Constant.width * 1,
                    child: Center(
                      child: Text('Doctor Details Is Not Available',
                          style: TextStyle(
                              fontSize: Constant.width * .05,
                              color: AppColors.redColor)),
                    ),
                  );
                }

                var data = PDDetailsVM.rxPDDetailsModel.value!;
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
                          borderRadius:
                              BorderRadius.circular(Constant.width * .05),
                          border: Border.all(color: AppColors.doctorGradient1)),
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
                                    image: AssetImage(
                                        'assets/images/doctor/female doctor.png'),
                                    // image: NetworkImage(data.image),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.circular(Constant.width * .04),
                                border: Border.all(
                                    color: AppColors.doctorGradient1)),
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
                                Text(toTitleCase(data.name),
                                    style: TextStyle(
                                        fontSize: Constant.width * .04,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),

                                /// Specialist
                                Row(
                                  children: [
                                    Icon(Icons.person,
                                        size: Constant.width * .05,
                                        color: AppColors.doctorGradient1),
                                    Text(toTitleCase(data.specialist),
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
                                    Icon(Icons.place,
                                        size: Constant.width * .05,
                                        color: AppColors.doctorGradient1),
                                    Text(toTitleCase('Korrah Chowk Hazaribagh'),
                                        style: TextStyle(
                                            fontSize: Constant.width * .035,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                AppColors.greyTextLightColor),
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
                                    borderRadius: BorderRadius.circular(
                                        Constant.width * .05),
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
                                              color:
                                                  AppColors.greyTextDarkColor),
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
                                var phone =
                                    PDDetailsVM.rxPDDetailsModel.value!.phone;
                                launchUrlString('tel://$phone');
                              },
                              child: Icon(Icons.call,
                                  size: Constant.width * .08,
                                  color: AppColors.doctorGradient3),
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
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> Doctor Biography Content
                    Text(toTitleCase(data.about),
                        style: TextStyle(
                            fontSize: Constant.width * .04,
                            color: AppColors.greyTextDarkColor),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Schedules"
                    Row(
                      children: [
                        Text('Select Date',
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Calender
                    Container(
                        height: Constant.height * .35,
                        width: Constant.width * 1,
                        decoration: BoxDecoration(
                            color: AppColors.cardBG,
                            borderRadius:
                                BorderRadius.circular(Constant.width * .04),
                            border:
                                Border.all(color: AppColors.doctorGradient1)),
                        child: CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              calendarType: CalendarDatePicker2Type.single,
                              currentDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 90)),
                              selectedDayHighlightColor:
                                  AppColors.doctorGradient1,
                            ),
                            value: PDDetailsVM.selectedDate,
                            onValueChanged: (dates) {
                              PDDetailsVM.selectedDate = dates;
                              print(PDDetailsVM.selectedDate);
                            })),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Choose time"
                    Row(
                      children: [
                        Text('Choose Time',
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Select Appointment Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Status Drop Down
                        Container(
                          height: Constant.height * .06,
                          width: Constant.width * .95,
                          padding: EdgeInsets.only(
                            left: Constant.width * .01,
                            right: Constant.width * .01,
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.cardBG,
                              borderRadius:
                                  BorderRadius.circular(Constant.width * .02),
                              border: Border.all(
                                color: AppColors.doctorGradient1,
                                width: Constant.width * .0025,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('select time :   ',
                                  style: TextStyle(
                                      fontSize: Constant.width * .05,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.greyTextDarkColor)),
                              DropdownButton(
                                value: PDDetailsVM.selectedValue.value,
                                dropdownColor: AppColors.eComCardBg,
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: Constant.width * .03),
                                iconSize: Constant.width * .08,
                                menuMaxHeight: Constant.height * .3,
                                items: data.timeList.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e,
                                        style: TextStyle(
                                            fontSize: Constant.width * .05,
                                            color: AppColors.black)),
                                    // child: Text(Constant.formateStatus(e), style: TextStyle(fontSize: Constant.width * .05)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  PDDetailsVM.selectedValue.value = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Description"
                    Row(
                      children: [
                        Text('Phone Number',
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    CommonTextField(
                      controller: PDDetailsVM.phoneController.value,
                      obSecure: false,
                      hintText: 'Mobile',
                      hintStyle: TextStyle(
                          fontSize: Constant.width * .04,
                          color: AppColors.greyTextDarkColor),
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Text ---> "Description"
                    Row(
                      children: [
                        Text('Description',
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black)),
                        SizedBox()
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    CommonTextField(
                      controller: PDDetailsVM.descriptionController.value,
                      obSecure: false,
                      hintText: 'Describe Your Health Issue',
                      hintStyle: TextStyle(
                          fontSize: Constant.width * .04,
                          color: AppColors.greyTextDarkColor),
                      maxLength: 1000,
                    ),

                    SizedBox(height: Constant.height * .1),
                  ],
                );
            }
          }),
        ),
      ),
      floatingActionButton: Obx(
        () {
          return Padding(
            padding: EdgeInsets.only(
              left: Constant.width * .07,
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: Constant.height * .07,
                width: Constant.width * 1,
                child: Center(
                  child: CommonButton(
                    isLoading: PDDetailsVM.isLoadingBookAppointment.value,
                    title: 'Book Appointment',
                    onTap: () async {
                      PDDetailsVM.bookAppointment(widget.doctorId);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String toTitleCase(String input) {
    return input
        .toLowerCase()
        .split(' ')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }
}
