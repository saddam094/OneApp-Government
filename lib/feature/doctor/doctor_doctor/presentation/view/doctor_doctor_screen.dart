import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_home/presentation/controller/doctor_home_controller.dart';
import 'package:one_app/feature/doctor/particular_category_doctor/presentation/view/particular_category_doctors_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';


class DoctorDoctorScreen extends StatefulWidget {
  const DoctorDoctorScreen({super.key});

  @override
  State<DoctorDoctorScreen> createState() => _DoctorDoctorScreenState();
}

class _DoctorDoctorScreenState extends State<DoctorDoctorScreen> {

  final homeVM = Get.put(DoctorHomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.doctorCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Heading Container
            SizedBox(
              height: Constant.height * .1,
              width: Constant.width * 1,
              child: Center(child: Text('Category', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.doctorGradient3)))
            ),
        
            /// main content
            Obx(() {
              switch (homeVM.rxRequestStatusDoctorCategory.value) {
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
                  if (homeVM
                      .rxDoctorCategoryModel.value!.categories.isEmpty) {
                    return Container(
                      height: Constant.height * .89,
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
                    height: Constant.height * .89,
                    width: Constant.width * 1,
                    padding: EdgeInsets.only(
                      left: Constant.width * .02,
                      right: Constant.width * .02,
                    ),
                    child: GridView.builder(
                      itemCount: homeVM.rxDoctorCategoryModel.value!.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: Constant.height * .01,
                          crossAxisSpacing: Constant.width * .02,
                          mainAxisExtent: Constant.height * .15
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data = homeVM.rxDoctorCategoryModel.value!.categories[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => ParticularCategoryDoctorsScreen(specialist: data.categoryName));
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
                              children: [
                                /// Image Container
                                Container(
                                  height: Constant.height * .1,
                                  width: Constant.width * .2,
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

                                SizedBox(height: Constant.height * .005),

                                /// Text ---> Doctor Categories
                                Text(
                                  data.categoryName,
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
          ],
        ),
      ),
    );
  }
}
