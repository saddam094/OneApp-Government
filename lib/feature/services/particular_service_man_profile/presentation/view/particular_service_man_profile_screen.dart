import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_service_man_profile/presentation/controller/particular_service_man_profile_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ParticularServiceManProfileScreen extends StatefulWidget {
  final String serviceManId;
  final bool isBooked;
  const ParticularServiceManProfileScreen({super.key, required this.serviceManId, required this.isBooked});

  @override
  State<ParticularServiceManProfileScreen> createState() => _ParticularServiceManProfileScreenState();
}

class _ParticularServiceManProfileScreenState extends State<ParticularServiceManProfileScreen> {

  final PSMProfileVM = Get.put(ParticularServiceManProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PSMProfileVM.particularServiceManProfile(widget.serviceManId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 1st Layer ---> Image Container
          Container(
            height: Constant.height * .3,
            width: Constant.width * 1,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                image: DecorationImage(
                  image: AssetImage('assets/images/services/tutor.png'),
                  // image: NetworkImage(PSMProfileVM.rxPSMProfileModel.value!.bannerImage),
                  fit: BoxFit.cover,
                )
            ),
          ),

          /// 2nd Layer ---> Main Content
          Container(
            height: Constant.height * .7,
            width: Constant.width * 1,
            margin: EdgeInsets.only(
                top: Constant.height * .28
            ),
            padding: EdgeInsets.only(
                top: Constant.height * .02,
                left: Constant.width * .02,
                right: Constant.width * .02
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Constant.width * .08),
                  topRight: Radius.circular(Constant.width * .08),
                ),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.servicesPrimaryColor,
                      spreadRadius: 3,
                      blurRadius: 3
                  )
                ]
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Specialist Text and Book mark Icon
                  Row(
                    children: [
                      /// Specialist ---> Text
                      SizedBox(
                        width: Constant.width * .8,
                        child: Text('Online Tutoring', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.primaryColor),maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),

                      /// BookMark ---> Icon
                      SizedBox(
                        width: Constant.width * .12,
                        height: Constant.height * .04,
                        child: PSMProfileVM.isLoadingSaved.value ? CircularProgressIndicator() : IconButton(
                          icon: Icon(widget.isBooked ? Icons.bookmark : Icons.bookmark_border_outlined, size: Constant.width * .06, color: AppColors.primaryColor),
                          onPressed: () {
                            /// Call Saved UnSaved Api
                            // PSMProfileVM.savedUnSaved(widget.serviceManId, !data.saved);
                          },
                        ),
                      )
                    ],
                  ),

                  /// name ---> Text
                  Row(
                    children: [
                      SizedBox(width: Constant.width * .1,child: Icon(Icons.person, size: Constant.width * .05, color: AppColors.servicesGradient1)),
                      SizedBox(width: Constant.width * .8,child: Text(toTitleCase('Ms Suman'), style: TextStyle(fontSize: Constant.width * .035, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),

                  /// Address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: Constant.width * .1,child: Icon(Icons.place, size: Constant.width * .05, color: AppColors.servicesGradient1)),

                      SizedBox(width: Constant.width * .8,child: Text(toTitleCase('Korrah Chowk Hazaribagh'), style: TextStyle(fontSize: Constant.width * .035, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),

                  /// star icon, rating and reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: Constant.width * .1,child: Icon(Icons.star, size: Constant.width * .05, color: AppColors.yellowColor)),

                      SizedBox(width: Constant.width * .8,child: Text('0.0', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),

                  SizedBox(height: Constant.height * .01),

                  /// About Me ---> Text
                  Text('About Me', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black)),


                  Text('I am an Online Tutor. i will teach you virtually. I am an Online Tutor. i will teach you virtually.',style: TextStyle(fontSize: Constant.width * .035, color: AppColors.greyTextDarkColor), maxLines: 8, overflow: TextOverflow.ellipsis),

                  SizedBox(height: Constant.height * .01),

                  widget.isBooked ? Container() : Container(
                    height: Constant.height * .85,
                    width:  Constant.width * 1,
                    child: Column(
                      children: [
                        /// Text ---> "Schedules"
                        Row(
                          children: [
                            Text('Select Date', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black)),
                            SizedBox()
                          ],
                        ),

                        SizedBox(height: Constant.height * .01),

                        /// Calender
                        Container(
                            height: Constant.height * .3,
                            width: Constant.width * 1,
                            decoration: BoxDecoration(
                                color: AppColors.eComCardBg,
                                borderRadius: BorderRadius.circular(Constant.width * .04)
                            ),
                            child: CalendarDatePicker2(
                                config: CalendarDatePicker2Config(
                                    calendarType: CalendarDatePicker2Type.single,
                                    currentDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(const Duration(days: 90)),
                                    selectedDayHighlightColor: AppColors.servicesGradient1
                                ),
                                value: PSMProfileVM.selectedDate,
                                onValueChanged: (dates) {
                                  PSMProfileVM.selectedDate = dates;
                                  print(PSMProfileVM.selectedDate);
                                }
                            )
                        ),

                        SizedBox(height: Constant.height * .01),

                        /// Text ---> "Choose time"
                        Row(
                          children: [
                            Text('Choose Time', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black)),
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
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(Constant.width * .02),
                                  border: Border.all(
                                    color: AppColors.primaryYellowColor,
                                    width: Constant.width * .0025,
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('select time :   ', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.w700, color: AppColors.primaryBlueColor)),
                                  DropdownButton(
                                    value: PSMProfileVM.selectedValue.value,
                                    dropdownColor: AppColors.white,
                                    style: TextStyle(color: AppColors.textColor, fontSize: Constant.width * .03),
                                    iconSize: Constant.width * .08,
                                    menuMaxHeight: Constant.height * .3,
                                    items: ['-- select time --','9-12 AM', '1-4 PM', '5-8 PM'].map((e) {
                                    // items: PSMProfileVM.rxPSMProfileModel.value!.timeList.map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e, style: TextStyle(fontSize: Constant.width * .05)),
                                        // child: Text(Constant.formateStatus(e), style: TextStyle(fontSize: Constant.width * .05)),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      PSMProfileVM.selectedValue.value = value!;
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
                            Text('Phone Number', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black)),
                            SizedBox()
                          ],
                        ),

                        SizedBox(height: Constant.height * .01),

                        CommonTextField(
                          controller: PSMProfileVM.phoneController.value,
                          obSecure: false,
                          hintText: 'Mobile',
                          hintStyle: TextStyle(fontSize: Constant.width * .04),
                        ),

                        SizedBox(height: Constant.height * .01),

                        /// Text ---> "Description"
                        Row(
                          children: [
                            Text('Description', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.black)),
                            SizedBox()
                          ],
                        ),

                        SizedBox(height: Constant.height * .01),

                        CommonTextField(
                          controller: PSMProfileVM.descriptionController.value,
                          obSecure: false,
                          hintText: 'Describe Your Health Issue',
                          hintStyle: TextStyle(fontSize: Constant.width * .04),
                          maxLength: 1000,
                        ),

                        // SizedBox(height: Constant.height * .1)
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),

          /// Back Icon
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: Constant.height * .06,
              width: Constant.width * .12,
              margin: EdgeInsets.only(
                  top: Constant.height * .02,
                  left: Constant.width * .03
              ),
              padding: EdgeInsets.only(
                  left: Constant.width * .03
              ),
              decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: BorderRadius.circular(Constant.width * .02),
                  border: Border.all(
                      color: AppColors.white,
                      width: 2
                  )
              ),
              child: Icon(Icons.arrow_back_ios, size: Constant.width * .08, color: AppColors.white),
            ),
          )
        ],
      ),
      // body: Obx(() {
      //   switch (PSMProfileVM.rxRequestStatusPSMProfile.value) {
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
      //       // if (PCSMListVM.rxPCSMLModel.value!.body.isEmpty) {
      //       //   return Container(
      //       //     height: Constant.height * .88,
      //       //     width: Constant.width * 1,
      //       //     child: Center(
      //       //       child: Text('Service Man List Is Empty',
      //       //           style: TextStyle(
      //       //               fontSize: Constant.width * .05,
      //       //               color: AppColors.redColor)),
      //       //     ),
      //       //   );
      //       // }
      //       var data = PSMProfileVM.rxPSMProfileModel.value!;
      //       return Stack(
      //         children: [
      //           /// 1st Layer ---> Image Container
      //           Container(
      //             height: Constant.height * .3,
      //             width: Constant.width * 1,
      //             decoration: BoxDecoration(
      //                 color: Colors.grey.shade400,
      //                 image: DecorationImage(
      //                   // image: AssetImage('assets/images/male services person.png'),
      //                   image: NetworkImage(PSMProfileVM.rxPSMProfileModel.value!.bannerImage),
      //                   fit: BoxFit.cover,
      //                 )
      //             ),
      //           ),
      //
      //           /// 2nd Layer ---> Main Content
      //           Container(
      //             height: Constant.height * .7,
      //             width: Constant.width * 1,
      //             margin: EdgeInsets.only(
      //                 top: Constant.height * .28
      //             ),
      //             padding: EdgeInsets.only(
      //                 top: Constant.height * .07,
      //                 left: Constant.width * .02,
      //                 right: Constant.width * .02
      //             ),
      //             decoration: BoxDecoration(
      //                 color: AppColors.white,
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(Constant.width * .08),
      //                   topRight: Radius.circular(Constant.width * .08),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: AppColors.servicesPrimaryColor,
      //                       spreadRadius: 3,
      //                       blurRadius: 3
      //                   )
      //                 ]
      //             ),
      //             child: SingleChildScrollView(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   /// Specialist Text and Book mark Icon
      //                   Row(
      //                     children: [
      //                       /// Specialist ---> Text
      //                       SizedBox(
      //                         width: Constant.width * .8,
      //                         child: Text(data.services.toUpperCase(), style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.primaryColor),maxLines: 1, overflow: TextOverflow.ellipsis),
      //                       ),
      //
      //                       /// BookMark ---> Icon
      //                       SizedBox(
      //                         width: Constant.width * .15,
      //                         height: Constant.height * .06,
      //                         child: PSMProfileVM.isLoadingSaved.value ? CircularProgressIndicator() : IconButton(
      //                           icon: Icon(data.saved ? Icons.bookmark : Icons.bookmark_border_outlined, size: Constant.width * .08, color: AppColors.primaryColor),
      //                           onPressed: () {
      //                             /// Call Saved UnSaved Api
      //                             PSMProfileVM.savedUnSaved(widget.serviceManId, !data.saved);
      //                           },
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //
      //                   /// name ---> Text
      //                   Text(data.name, style: TextStyle(fontSize: Constant.width * .05, color: AppColors.black, fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis),
      //
      //                   /// Address
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       SizedBox(width: Constant.width * .1,child: Icon(Icons.place, size: Constant.width * .06, color: AppColors.greyTextDarkColor)),
      //
      //                       SizedBox(width: Constant.width * .8,child: Text(data.address, style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
      //                     ],
      //                   ),
      //
      //                   /// star icon, rating and reviews
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       SizedBox(width: Constant.width * .1,child: Icon(Icons.star, size: Constant.width * .06, color: AppColors.yellowColor)),
      //
      //                       SizedBox(width: Constant.width * .8,child: Text('${data.rating} (${data.reviewCount} Reviews)', style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
      //                     ],
      //                   ),
      //
      //                   SizedBox(height: Constant.height * .01),
      //
      //                   /// About Me ---> Text
      //                   Text('About Me', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
      //
      //
      //                   Text(data.about,style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 8, overflow: TextOverflow.ellipsis),
      //
      //                   SizedBox(height: Constant.height * .01),
      //
      //                   widget.isBooked ? Container() : Container(
      //                     height: Constant.height * .85,
      //                     width:  Constant.width * 1,
      //                     child: Column(
      //                       children: [
      //                         /// Text ---> "Schedules"
      //                         Row(
      //                           children: [
      //                             Text('Select Date', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
      //                             SizedBox()
      //                           ],
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         /// Calender
      //                         Container(
      //                             height: Constant.height * .3,
      //                             width: Constant.width * 1,
      //                             decoration: BoxDecoration(
      //                                 color: AppColors.eComCardBg,
      //                                 borderRadius: BorderRadius.circular(Constant.width * .04)
      //                             ),
      //                             child: CalendarDatePicker2(
      //                                 config: CalendarDatePicker2Config(
      //                                   calendarType: CalendarDatePicker2Type.single,
      //                                   currentDate: DateTime.now(),
      //                                   firstDate: DateTime.now(),
      //                                   lastDate: DateTime.now().add(const Duration(days: 90)),
      //                                   selectedDayHighlightColor: AppColors.primaryYellowColor
      //                                 ),
      //                                 value: PSMProfileVM.selectedDate,
      //                                 onValueChanged: (dates) {
      //                                   PSMProfileVM.selectedDate = dates;
      //                                   print(PSMProfileVM.selectedDate);
      //                                 }
      //                             )
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         /// Text ---> "Choose time"
      //                         Row(
      //                           children: [
      //                             Text('Choose Time', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
      //                             SizedBox()
      //                           ],
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         /// Select Appointment Time
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             /// Status Drop Down
      //                             Container(
      //                               height: Constant.height * .06,
      //                               width: Constant.width * .95,
      //                               padding: EdgeInsets.only(
      //                                 left: Constant.width * .01,
      //                                 right: Constant.width * .01,
      //                               ),
      //                               decoration: BoxDecoration(
      //                                 color: AppColors.white,
      //                                   borderRadius: BorderRadius.circular(Constant.width * .02),
      //                                   border: Border.all(
      //                                     color: AppColors.primaryYellowColor,
      //                                     width: Constant.width * .0025,
      //                                   )
      //                               ),
      //                               child: Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   Text('select time :   ', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.w700, color: AppColors.primaryBlueColor)),
      //                                   DropdownButton(
      //                                     value: PSMProfileVM.selectedValue.value,
      //                                     dropdownColor: AppColors.white,
      //                                     style: TextStyle(color: AppColors.textColor, fontSize: Constant.width * .03),
      //                                     iconSize: Constant.width * .08,
      //                                     menuMaxHeight: Constant.height * .3,
      //                                     // items: ['-- select time --','9-12 AM', '1-4 PM', '5-8 PM'].map((e) {
      //                                     items: PSMProfileVM.rxPSMProfileModel.value!.timeList.map((e) {
      //                                       return DropdownMenuItem(
      //                                         value: e,
      //                                         child: Text(e, style: TextStyle(fontSize: Constant.width * .05)),
      //                                         // child: Text(Constant.formateStatus(e), style: TextStyle(fontSize: Constant.width * .05)),
      //                                       );
      //                                     }).toList(),
      //                                     onChanged: (value) {
      //                                       PSMProfileVM.selectedValue.value = value!;
      //                                     },
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         /// Text ---> "Description"
      //                         Row(
      //                           children: [
      //                             Text('Phone Number', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
      //                             SizedBox()
      //                           ],
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         CommonTextField(
      //                           controller: PSMProfileVM.phoneController.value,
      //                           obSecure: false,
      //                           hintText: 'Mobile',
      //                           hintStyle: TextStyle(fontSize: Constant.width * .04),
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         /// Text ---> "Description"
      //                         Row(
      //                           children: [
      //                             Text('Description', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
      //                             SizedBox()
      //                           ],
      //                         ),
      //
      //                         SizedBox(height: Constant.height * .01),
      //
      //                         CommonTextField(
      //                           controller: PSMProfileVM.descriptionController.value,
      //                           obSecure: false,
      //                           hintText: 'Describe Your Health Issue',
      //                           hintStyle: TextStyle(fontSize: Constant.width * .04),
      //                           maxLength: 1000,
      //                         ),
      //
      //                         // SizedBox(height: Constant.height * .1)
      //                       ],
      //                     ),
      //                   ),
      //
      //
      //
      //                 ],
      //               ),
      //             ),
      //           ),
      //
      //
      //           /// Profile Image
      //           Container(
      //             height: Constant.height * .18,
      //             width: Constant.width * .4,
      //             margin: EdgeInsets.only(
      //               top: Constant.height * .19,
      //               left: Constant.width * .3
      //             ),
      //             decoration: BoxDecoration(
      //               color: AppColors.eComCardBg,
      //               borderRadius: BorderRadius.circular(Constant.width * .2),
      //               border: Border.all(
      //                 color: AppColors.primaryColor,
      //                 width: Constant.width * .005
      //               ),
      //               image: DecorationImage(
      //                   image: NetworkImage(PSMProfileVM.rxPSMProfileModel.value!.image),
      //                 fit: BoxFit.cover
      //               )
      //             ),
      //           ),
      //
      //           /// Back Icon
      //           InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: Container(
      //               height: Constant.height * .06,
      //               width: Constant.width * .12,
      //               margin: EdgeInsets.only(
      //                   top: Constant.height * .02,
      //                   left: Constant.width * .03
      //               ),
      //               padding: EdgeInsets.only(
      //                   left: Constant.width * .03
      //               ),
      //               decoration: BoxDecoration(
      //                   color: AppColors.primaryBlueColor,
      //                   borderRadius: BorderRadius.circular(Constant.width * .02),
      //                   border: Border.all(
      //                       color: AppColors.white,
      //                       width: 2
      //                   )
      //               ),
      //               child: Icon(Icons.arrow_back_ios, size: Constant.width * .08, color: AppColors.white),
      //             ),
      //           )
      //         ],
      //       );
      //   }
      // }),
      backgroundColor: AppColors.white,
      floatingActionButton: Obx(() {
        return !widget.isBooked ? Container(
          height: Constant.height * .07,
          width: Constant.width * .97,
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: widget.isBooked ? InkWell(
            onTap: () {
              PSMProfileVM.cancelBookingServiceMan(widget.serviceManId);
            },
            child: Container(
              height: Constant.height * .07,
              width: Constant.width * .7,
              margin: EdgeInsets.only(
                left: Constant.width * .05
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueColor,
                borderRadius: BorderRadius.circular(Constant.width * .08),
              ),
              child: Center(
                child: PSMProfileVM.isLoadingBook.value ? CircularProgressIndicator(color: AppColors.white) : Text('Cancel Booking', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.w600, color: AppColors.white),),
              ),
            ),
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// Call Now ---> Button
              InkWell(
                onTap: () {
                  var phone = '6202548771';
                  launchUrlString('tel://$phone');
                },
                child: Container(
                  height: Constant.height * .05,
                  width: Constant.width * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Constant.width * .08),
                      border: Border.all(
                          color: AppColors.primaryColor,
                          width: 3
                      )
                  ),
                  child: Center(child: Text('Call Now', style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.w600, color: AppColors.primaryColor),)),
                ),
              ),

              /// Book ---> Button
              InkWell(
                onTap: () {
                  // PSMProfileVM.bookServiceMan(widget.serviceManId);
                },
                child: Container(
                  height: Constant.height * .05,
                  width: Constant.width * .4,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(Constant.width * .08),
                  ),
                  child: Center(
                    child: PSMProfileVM.isLoadingBook.value ? CircularProgressIndicator(color: AppColors.white) : Text('Book', style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.w600, color: AppColors.white),),
                  ),
                ),
              )
            ],
          ),
        ) : const SizedBox();
      }),
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
