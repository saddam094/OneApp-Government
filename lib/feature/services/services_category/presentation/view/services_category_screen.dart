import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/particular_services_category/presentation/view/particular_services_category_screen.dart';
import 'package:one_app/feature/services/services_home/presentation/controller/service_home_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';


class ServicesCategoryScreen extends StatefulWidget {
  const ServicesCategoryScreen({super.key});

  @override
  State<ServicesCategoryScreen> createState() => _ServicesCategoryScreenState();
}

class _ServicesCategoryScreenState extends State<ServicesCategoryScreen> {

  final serviceCategoryVM = Get.put(ServiceHomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceCategoryVM.serviceCategoryList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Heading Container
            SizedBox(
              height: Constant.height * .1,
              width: Constant.width * 1,
              child: Center(child: Text('Services Category', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.primaryColor)))
            ),
        
            /// main content
            Container(
              height: Constant.height * .89,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                left: Constant.width * .02,
                right: Constant.width * .02,
              ),
              child: GridView.builder(
                itemCount: serviceCategoryVM.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: Constant.height * .01,
                    crossAxisSpacing: Constant.width * .02,
                    mainAxisExtent: Constant.height * .2
                ),
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var data = serviceCategoryVM.categoryList[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ParticularServicesCategoryScreen(category: data['title'].toString()));
                    },
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /// Image Container
                          Container(
                            height: Constant.height * .11,
                            width: Constant.width * .28,
                            decoration: BoxDecoration(
                              color: AppColors.cardBG,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.greyTextDarkColor
                              )
                            ),
                            child: Center(
                              child: Container(
                                height: Constant.height * .05,
                                width: Constant.width * .12,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(data['image'].toString()),
                                      //   image: NetworkImage(data['image'].toString()),
                                        fit: BoxFit.fill
                                    ),
                                ),
                              ),
                            ),
                          ),

                          /// Title ---> Text
                          Text(toTitleCase(data['title'].toString()), style: TextStyle(fontSize: Constant.width * .035, color: AppColors.black))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
            // Obx(() {
            //   switch (serviceCategoryVM.rxRequestStatusServiceCategory.value) {
            //     case Status.LOADING:
            //       return Container(
            //         height: Constant.height * .89,
            //         width: Constant.width * 1,
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //
            //     case Status.ERROR:
            //       return Container(
            //         height: Constant.height * .89,
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
            //       if (serviceCategoryVM.rxServiceCategoryModel.value!.categories.isEmpty) {
            //         return Container(
            //           height: Constant.height * .89,
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
            //         height: Constant.height * .89,
            //         width: Constant.width * 1,
            //         padding: EdgeInsets.only(
            //           left: Constant.width * .02,
            //           right: Constant.width * .02,
            //         ),
            //         child: GridView.builder(
            //           itemCount: serviceCategoryVM.rxServiceCategoryModel.value!.categories.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3,
            //               mainAxisSpacing: Constant.height * .01,
            //               crossAxisSpacing: Constant.width * .02,
            //               mainAxisExtent: Constant.height * .2
            //           ),
            //           physics: const NeverScrollableScrollPhysics(),
            //           padding: EdgeInsets.zero,
            //           itemBuilder: (context, index) {
            //             var data = serviceCategoryVM.rxServiceCategoryModel.value!.categories[index];
            //             return InkWell(
            //               onTap: () {
            //                 Get.to(() => ParticularServicesCategoryScreen(category: data.categoryName));
            //               },
            //               child: SizedBox(
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     /// Image Container
            //                     Container(
            //                       height: Constant.height * .11,
            //                       width: Constant.width * .28,
            //                       decoration: BoxDecoration(
            //                         color: AppColors.eComCardBg,
            //                           image: DecorationImage(
            //                               // image: AssetImage('assets/images/plumbing_services.png'),
            //                             image: NetworkImage(data.imageUrl),
            //                               fit: BoxFit.fill
            //                           ),
            //                           border: Border.all(
            //                               color: AppColors.white,
            //                               width: Constant.width * .008
            //                           ),
            //                           borderRadius: BorderRadius.circular(Constant.width * .04)
            //                       ),
            //                     ),
            //
            //                     /// Title ---> Text
            //                     Text(data.categoryName, style: TextStyle(fontSize: Constant.width * .04, color: AppColors.black),)
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //   }
            // }),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
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
