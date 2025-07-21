import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/presentation/controller/e_commerce_dashboard_controller.dart';
import 'package:one_app/feature/e-commerce/my_cart/presentation/view/my_cart_screen.dart';
import 'package:one_app/feature/e-commerce/particular_category/presentation/view/particular_category_screen.dart';
import 'package:one_app/feature/e-commerce/particular_product/presentation/view/particular_product_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ECommerceDashboardScreen extends StatefulWidget {
  const ECommerceDashboardScreen({super.key});

  @override
  State<ECommerceDashboardScreen> createState() =>
      _ECommerceDashboardScreenState();
}

class _ECommerceDashboardScreenState extends State<ECommerceDashboardScreen> {
  final eComDSVM = Get.put(ECommerceDashboardController());

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // eComDSVM.eCommerceCategoryList();
    // eComDSVM.popularDoctorList();
    // eComDSVM.groceryDealsList();
    // eComDSVM.prescribedMedicineList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      // drawer: Drawer(
      //   width: Constant.width * .75,
      //   backgroundColor: AppColors.primaryBlueColor,
      //   child: Column(
      //     children: [
      //       SizedBox(height: Constant.height * .04),
      //
      //       /// Profile Box
      //       Container(
      //         height: Constant.height * .07,
      //         width: Constant.width * .75,
      //         padding: EdgeInsets.only(
      //           left: Constant.width * .05,
      //           right: Constant.width * .05,
      //         ),
      //         child: Center(
      //             child: Text(
      //           'E-Commerce',
      //           style: TextStyle(
      //               fontSize: Constant.width * .08,
      //               fontWeight: FontWeight.bold),
      //         )),
      //       ),
      //
      //       SizedBox(height: Constant.height * .04),
      //
      //       /// Items
      //       SizedBox(
      //         height: Constant.height * .65,
      //         child: Column(
      //           children: [
      //             /// home -----> 1
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   left: Constant.width * .05,
      //                   right: Constant.width * .05,
      //                   bottom: Constant.height * .01),
      //               child: ListTile(
      //                 onTap: () {
      //                   Get.offAll(() => const ECommerceDashboardScreen());
      //                 },
      //                 leading: Icon(
      //                   Icons.home_outlined,
      //                   color: AppColors.white,
      //                   size: Constant.width * .09,
      //                 ),
      //                 title: Text('Home',
      //                     style: TextStyle(
      //                         fontSize: Constant.width * .04,
      //                         color: AppColors.white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: Constant.width * .003)),
      //               ),
      //             ),
      //
      //             /// View Profile ------> 3
      //             // Padding(
      //             //   padding: EdgeInsets.only(
      //             //       left: Constant.width * .05,
      //             //       right: Constant.width * .05,
      //             //       bottom: Constant.height * .01
      //             //   ),
      //             //   child: ListTile(
      //             //     onTap: () {
      //             //       // Get.to(() => const ProfileScreen());
      //             //     },
      //             //     leading: Icon(Icons.person_2_outlined, color: AppColors.white, size: Constant.width * .09,),
      //             //
      //             //     title: Text('View Profile', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
      //             //   ),
      //             // ),
      //
      //             /// My Order ------> 4
      //             // Padding(
      //             //   padding: EdgeInsets.only(
      //             //       left: Constant.width * .05,
      //             //       right: Constant.width * .05,
      //             //       bottom: Constant.height * .01),
      //             //   child: ListTile(
      //             //     onTap: () {
      //             //       Get.to(() => const MyOrderScreen());
      //             //     },
      //             //     leading: Icon(
      //             //       Icons.shopping_bag_outlined,
      //             //       color: AppColors.white,
      //             //       size: Constant.width * .09,
      //             //     ),
      //             //     title: Text('My Order',
      //             //         style: TextStyle(
      //             //             fontSize: Constant.width * .04,
      //             //             color: AppColors.white,
      //             //             fontWeight: FontWeight.w600,
      //             //             letterSpacing: Constant.width * .003)),
      //             //   ),
      //             // ),
      //
      //             /// Help & Support ------> 6
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   left: Constant.width * .05,
      //                   right: Constant.width * .05,
      //                   bottom: Constant.height * .01),
      //               child: ListTile(
      //                 onTap: () {},
      //                 leading: Icon(
      //                   Icons.help_center_outlined,
      //                   color: AppColors.white,
      //                   size: Constant.width * .09,
      //                 ),
      //                 title: Text('Help & Support',
      //                     style: TextStyle(
      //                         fontSize: Constant.width * .04,
      //                         color: AppColors.white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: Constant.width * .003)),
      //               ),
      //             ),
      //
      //             /// Contact Us ------> 7
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   left: Constant.width * .05,
      //                   right: Constant.width * .05,
      //                   bottom: Constant.height * .01),
      //               child: ListTile(
      //                 onTap: () {},
      //                 leading: Icon(
      //                   Icons.contact_page_outlined,
      //                   color: AppColors.white,
      //                   size: Constant.width * .09,
      //                 ),
      //                 title: Text('Contact Us',
      //                     style: TextStyle(
      //                         fontSize: Constant.width * .04,
      //                         color: AppColors.white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: Constant.width * .003)),
      //               ),
      //             ),
      //
      //             /// Security & Privacy ------> 8
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   left: Constant.width * .05,
      //                   right: Constant.width * .05,
      //                   bottom: Constant.height * .01),
      //               child: ListTile(
      //                 onTap: () {},
      //                 leading: Icon(
      //                   Icons.security_outlined,
      //                   color: AppColors.white,
      //                   size: Constant.width * .09,
      //                 ),
      //                 title: Text('Security & Privacy',
      //                     style: TextStyle(
      //                         fontSize: Constant.width * .04,
      //                         color: AppColors.white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: Constant.width * .003)),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        height: Constant.height * 1,
        width: Constant.width * 1,
        child: Stack(
          children: [
            /// Main Content
            Padding(
              padding: EdgeInsets.only(
                top: Constant.height * .24,
                left: Constant.width * .02,
                right: Constant.width * .02,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories', style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.bold, color: AppColors.black)),

                        // CommonTextButton(
                        //   onTap: () {
                        //
                        //   },
                        //   text: 'See All',
                        //   style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.productsGradient1, decoration: TextDecoration.underline, decorationColor: AppColors.productsGradient1),
                        // )
                      ],
                    ),

                    /// Categories
                    Container(
                      height: Constant.height * .13,
                      width: Constant.width * 1,
                      child: ListView.builder(
                        itemCount:
                        eComDSVM.categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data =
                          eComDSVM.categoryList[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => ParticularCategoryScreen(
                                  title: data['title'].toString()));
                            },
                            child: Container(
                              height: Constant.height * .11,
                              width: Constant.width * .18,
                              margin: EdgeInsets.only(
                                left: Constant.width * .005,
                                right: Constant.width * .005,
                              ),
                              decoration: BoxDecoration(
                                // color: AppColors.eComCardBg,
                                  borderRadius: BorderRadius.circular(
                                      Constant.width * .02)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// Image Container
                                  Container(
                                    height: Constant.height * .08,
                                    width: Constant.width * .16,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(data['image'].toString()),
                                          // image: NetworkImage(data.imageURL),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle,
                                    ),
                                  ),

                                  /// Text ---> Doctor Categories
                                  Text(data['title'].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Constant.width * .033),
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
                    //   switch (eComDSVM.rxRequestStatusCategory.value) {
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
                    //       if (eComDSVM.rxGroceryDealsModel.value!.groceries.isEmpty) {
                    //         return Container(
                    //           height: Constant.height * .165,
                    //           width: Constant.width * 1,
                    //           child: Center(
                    //             child: Text('E-Commerce Category List Is Empty',
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
                    //           itemCount:
                    //               eComDSVM.rxCategoryModel.value!.categories.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             var data =
                    //                 eComDSVM.rxCategoryModel.value!.categories[index];
                    //             return InkWell(
                    //               onTap: () {
                    //                 Get.to(() => ParticularCategoryScreen(
                    //                     title: data.categoryName));
                    //               },
                    //               child: Container(
                    //                 height: Constant.height * .12,
                    //                 width: Constant.width * .3,
                    //                 padding: EdgeInsets.only(
                    //                   left: Constant.width * .02,
                    //                   right: Constant.width * .02,
                    //                 ),
                    //                 margin: EdgeInsets.only(
                    //                   left: Constant.width * .01,
                    //                   right: Constant.width * .01,
                    //                   top: Constant.height * .005,
                    //                   // bottom: Constant.height * .005,
                    //                 ),
                    //                 decoration: BoxDecoration(
                    //                     color: AppColors.eComCardBg,
                    //                     borderRadius: BorderRadius.circular(
                    //                         Constant.width * .02)),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     /// Text ---> Doctor Categories
                    //                     Text(data.categoryName,
                    //                         style: TextStyle(
                    //                             fontSize: Constant.width * .05),
                    //                         maxLines: 2,
                    //                         overflow: TextOverflow.ellipsis),
                    //
                    //                     SizedBox(height: Constant.height * .01),
                    //
                    //                     /// Image Container
                    //                     Container(
                    //                       height: Constant.height * .1,
                    //                       width: Constant.width * .28,
                    //                       decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             image: NetworkImage(data.imageURL),
                    //                             fit: BoxFit.fill),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //   }
                    // }),


                    /// Top Selling Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Selling', style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.bold, color: AppColors.black)),

                        CommonTextButton(
                          onTap: () {

                          },
                          text: 'See All',
                          style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.productsGradient1, decoration: TextDecoration.underline, decorationColor: AppColors.productsGradient1),
                        )
                      ],
                    ),

                    /// Top Selling Product
                    Container(
                      height: Constant.height * .25,
                      width: Constant.width * 1,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => const ParticularProductScreen());
                            },
                            child: Container(
                              height: Constant.height * .25,
                              width: Constant.width * .45,
                              margin: EdgeInsets.only(
                                right: Constant.width * .01,
                                left: Constant.width * .025,
                              ),
                              padding: EdgeInsets.only(
                                top: Constant.height * .008,
                                left: Constant.width * .02,
                                right: Constant.width * .02,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cardBG,
                                borderRadius: BorderRadius.circular(Constant.width * .05),
                                border: Border.all(
                                    color: AppColors.productsGradient1
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Image Container
                                  Container(
                                    height: Constant.height * .18,
                                    width: Constant.width * .45,
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBG,
                                      image: DecorationImage(
                                          image: AssetImage(index % 2 == 0 ? 'assets/images/products/cloth.png' : 'assets/images/products/honey.png'),
                                          fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.circular(Constant.width * .04),
                                    ),
                                  ),

                                  /// Title
                                  Text(index % 2 == 0 ? 'Mens Harrington Jacket' : 'Home Made Honey', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 1),

                                  /// Price
                                  Text(index % 2 == 0 ? '₹ 148.00' : '₹ 55.00', style: TextStyle(fontSize: Constant.width * .04,fontWeight: FontWeight.bold, color: AppColors.black), maxLines: 1),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Offer Banner
                    Container(
                      height: Constant.height * .15,
                      width: Constant.width * 1,
                      decoration: BoxDecoration(
                          color: AppColors.cardBG,
                          borderRadius: BorderRadius.circular(Constant.width * .03),
                          border: Border.all(
                              color: AppColors.productsGradient1, width: Constant.width * .005),
                          image: DecorationImage(
                              image: AssetImage('assets/images/products/banner.png'),
                              fit: BoxFit.fill)
                      ),
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Top Selling Price
                    Row(
                      children: [
                        Text('Products', style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.bold, color: AppColors.black)),
                      ],
                    ),

                    Container(
                      height: Constant.height * .265 * ((5/2)+.5),
                      width: Constant.width * 1,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: Constant.height * .25,
                          mainAxisSpacing: Constant.height * .015,
                          crossAxisSpacing: Constant.width * .03,
                        ),
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => const ParticularProductScreen());
                            },
                            child: Container(
                              height: Constant.height * .25,
                              width: Constant.width * .45,
                              padding: EdgeInsets.only(
                                top: Constant.height * .008,
                                left: Constant.width * .02,
                                right: Constant.width * .02,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cardBG,
                                borderRadius: BorderRadius.circular(Constant.width * .05),
                                border: Border.all(
                                    color: AppColors.productsGradient1
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Image Container
                                  Container(
                                    height: Constant.height * .18,
                                    width: Constant.width * .45,
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBG,
                                      image: DecorationImage(
                                          image: AssetImage(index % 2 == 0 ? 'assets/images/products/cloth.png' : 'assets/images/products/honey.png'),
                                          fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.circular(Constant.width * .04),
                                    ),
                                  ),

                                  /// Title
                                  Text(index % 2 == 0 ? 'Mens Harrington Jacket' : 'Home Made Honey', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 1),

                                  /// Price
                                  Text(index % 2 == 0 ? '₹ 148.00' : '₹ 55.00', style: TextStyle(fontSize: Constant.width * .04,fontWeight: FontWeight.bold, color: AppColors.black), maxLines: 1),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // /// Popular Restaurant ---> Text
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     /// Text ---> "Find Your Doctor"
                    //     Text('Popular Dishes',
                    //         style: TextStyle(
                    //             fontSize: Constant.width * .05,
                    //             fontWeight: FontWeight.bold,
                    //             color: AppColors.primaryYellowColor)),
                    //
                    //     /// TextButton ---> "View All"
                    //     // InkWell(
                    //     //   onTap: () {},
                    //     //   child: Container(
                    //     //     height: Constant.height * .05,
                    //     //     width: Constant.width * .2,
                    //     //     decoration: BoxDecoration(
                    //     //         color: Colors.grey.shade300,
                    //     //         borderRadius:
                    //     //             BorderRadius.circular(Constant.width * .05)),
                    //     //     child: Center(
                    //     //         child: Icon(Icons.arrow_right_alt,
                    //     //             size: Constant.width * .1)),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    //
                    // /// Dishes ---> ListView
                    // Obx(() {
                    //   switch (eComDSVM.rxRequestStatusPopularDish.value) {
                    //     case Status.LOADING:
                    //       return Container(
                    //         height: Constant.height * .26,
                    //         width: Constant.width * 1,
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       );
                    //
                    //     case Status.ERROR:
                    //       return Container(
                    //         height: Constant.height * .26,
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
                    //       if (eComDSVM.rxPopularDishesModel.value!.dishes.isEmpty) {
                    //         return Container(
                    //           height: Constant.height * .26,
                    //           width: Constant.width * 1,
                    //           child: Center(
                    //             child: Text('Popular Dish List Is Empty',
                    //                 style: TextStyle(
                    //                     fontSize: Constant.width * .05,
                    //                     color: AppColors.redColor)),
                    //           ),
                    //         );
                    //       }
                    //
                    //       return Container(
                    //         height: Constant.height * .26,
                    //         width: Constant.width * 1,
                    //         child: ListView.builder(
                    //           itemCount:
                    //               eComDSVM.rxPopularDishesModel.value!.dishes.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             var data = eComDSVM
                    //                 .rxPopularDishesModel.value!.dishes[index];
                    //             return dishCard(data.dishName, data.aboutDish,
                    //                 data.rating, data.image, data.dishId, data.skuId);
                    //           },
                    //         ),
                    //       );
                    //   }
                    // }),
                    //
                    // /// Deals On Grocery ---> Text
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     /// Text ---> "Find Your Doctor"
                    //     Text('Deals On Grocery',
                    //         style: TextStyle(
                    //             fontSize: Constant.width * .05,
                    //             fontWeight: FontWeight.bold,
                    //             color: AppColors.primaryYellowColor)),
                    //
                    //     /// TextButton ---> "View All"
                    //     // InkWell(
                    //     //   onTap: () {},
                    //     //   child: Container(
                    //     //     height: Constant.height * .05,
                    //     //     width: Constant.width * .2,
                    //     //     decoration: BoxDecoration(
                    //     //         color: Colors.grey.shade300,
                    //     //         borderRadius:
                    //     //             BorderRadius.circular(Constant.width * .05)),
                    //     //     child: Center(
                    //     //         child: Icon(Icons.arrow_right_alt,
                    //     //             size: Constant.width * .1)),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    //
                    // /// Groceries ---> ListView
                    // Obx(() {
                    //   switch (eComDSVM.rxRequestStatusGroceryDeals.value) {
                    //     case Status.LOADING:
                    //       return Container(
                    //         height: Constant.height * .25,
                    //         width: Constant.width * 1,
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       );
                    //
                    //     case Status.ERROR:
                    //       return Container(
                    //         height: Constant.height * .25,
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
                    //       if (eComDSVM.rxGroceryDealsModel.value!.groceries.isEmpty) {
                    //         return Container(
                    //           height: Constant.height * .25,
                    //           width: Constant.width * 1,
                    //           child: Center(
                    //             child: Text('Grocery Item List Is Empty',
                    //                 style: TextStyle(
                    //                     fontSize: Constant.width * .05,
                    //                     color: AppColors.redColor)),
                    //           ),
                    //         );
                    //       }
                    //
                    //       return Container(
                    //         height: Constant.height * .24,
                    //         width: Constant.width * 1,
                    //         child: ListView.builder(
                    //           itemCount: eComDSVM
                    //               .rxGroceryDealsModel.value!.groceries.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             var data = eComDSVM
                    //                 .rxGroceryDealsModel.value!.groceries[index];
                    //             return groceryItemCard(
                    //                 data.productName,
                    //                 data.price.toString(),
                    //                 data.image,
                    //                 data.productId,
                    //                 data.skuId);
                    //           },
                    //         ),
                    //       );
                    //   }
                    // }),
                    //
                    // /// Prescribed Medicine ---> Text
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     /// Text ---> "Find Your Doctor"
                    //     Text('Prescribed By Doctor',
                    //         style: TextStyle(
                    //             fontSize: Constant.width * .05,
                    //             fontWeight: FontWeight.bold,
                    //             color: AppColors.primaryYellowColor)),
                    //
                    //     /// TextButton ---> "View All"
                    //     // InkWell(
                    //     //   onTap: () {},
                    //     //   child: Container(
                    //     //     height: Constant.height * .05,
                    //     //     width: Constant.width * .2,
                    //     //     decoration: BoxDecoration(
                    //     //         color: Colors.grey.shade300,
                    //     //         borderRadius:
                    //     //             BorderRadius.circular(Constant.width * .05)),
                    //     //     child: Center(
                    //     //         child: Icon(Icons.arrow_right_alt,
                    //     //             size: Constant.width * .1)),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    //
                    // /// Medicines ---> ListView
                    // Obx(() {
                    //   switch (eComDSVM.rxRequestStatusPrescribedMedicine.value) {
                    //     case Status.LOADING:
                    //       return Container(
                    //         height: Constant.height * .22,
                    //         width: Constant.width * 1,
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       );
                    //
                    //     case Status.ERROR:
                    //       return Container(
                    //         height: Constant.height * .22,
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
                    //       if (eComDSVM
                    //           .rxPrescribedMedicineModel.value!.medicines.isEmpty) {
                    //         return Container(
                    //           height: Constant.height * .22,
                    //           width: Constant.width * 1,
                    //           child: Center(
                    //             child: Text('Prescribed Medicine List Is Empty',
                    //                 style: TextStyle(
                    //                     fontSize: Constant.width * .05,
                    //                     color: AppColors.redColor)),
                    //           ),
                    //         );
                    //       }
                    //
                    //       return Container(
                    //         height: Constant.height * .24,
                    //         width: Constant.width * 1,
                    //         child: ListView.builder(
                    //           itemCount: eComDSVM
                    //               .rxPrescribedMedicineModel.value!.medicines.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             var data = eComDSVM.rxPrescribedMedicineModel.value!
                    //                 .medicines[index];
                    //             return medicineCard(
                    //                 data.productName,
                    //                 // '100 mg',
                    //                 data.price.toString(),
                    //                 data.image,
                    //                 data.productId,
                    //                 data.skuId);
                    //           },
                    //         ),
                    //       );
                    //   }
                    // }),

                    SizedBox(height: Constant.height * .03),
                  ],
                ),
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
                      AppColors.productsGradient2,
                      AppColors.productsGradient1,
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
                              color: AppColors.productsGradient1,
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
                                color: AppColors.productsGradient2,
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
                          hintText: 'Search Products',
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
                            color: AppColors.productsGradient2,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            /// Cart and Order
            Positioned(
              top: Constant.height * .85,
              left: Constant.width * .3,
              child: Container(
                height: Constant.height * .08,
                width: Constant.width * .4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.productsGradient2,
                      AppColors.productsGradient1
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(Constant.width * .1),
                  border: Border.all(
                    color: AppColors.productsGradient2
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Cart --> Button
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: Constant.height * .075,
                        width: Constant.width * .15,
                        child: Center(
                          child: Icon(Icons.shopping_cart, size: Constant.width * .08, color: AppColors.white),
                        ),
                      ),
                    ),

                    /// Order --> Button
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: Constant.height * .075,
                        width: Constant.width * .15,
                        child: Center(
                          child: Icon(Icons.card_travel, size: Constant.width * .08, color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }

  /// Dish Card
  Widget dishCard(String name, about, rating, imagePath, productId, skuId) {
    return InkWell(
      onTap: () {
        // Get.to(ParticularProductScreen(
        //     productId: productId, skuId: skuId, category: 'food'));
      },
      child: Container(
        height: Constant.height * .25,
        width: Constant.width * .4,
        padding: EdgeInsets.only(
          top: Constant.height * .005,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        margin: EdgeInsets.only(
          top: Constant.height * .01,
          bottom: Constant.height * .01,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        decoration: BoxDecoration(
            color: AppColors.eComCardBg,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image Container
            Container(
              height: Constant.height * .15,
              width: Constant.width * .38,
              decoration: BoxDecoration(
                color: AppColors.white,
                  borderRadius: BorderRadius.circular(Constant.width * .02),
                  border: Border.all(
                      color: AppColors.white, width: Constant.width * .005),
                  image: DecorationImage(
                      image: NetworkImage(imagePath), fit: BoxFit.cover)),
            ),

            /// dish title ---> Text
            Text(name,
                style: TextStyle(
                    fontSize: Constant.width * .045,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),

            /// about dish ---> Text
            Text(about,
                style: TextStyle(
                    fontSize: Constant.width * .04,
                    color: AppColors.greyTextDarkColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),

            /// Star ---> Icon and rating, distance ---> Text
            // Row(
            //   children: [
            //     Icon(Icons.star,
            //         size: Constant.width * .055, color: AppColors.yellowColor),
            //     Text(' ${rating}',
            //         style: TextStyle(
            //             fontSize: Constant.width * .04,
            //             color: AppColors.primaryGreyColor))
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  /// Grocery Item Card
  Widget groceryItemCard(String name, price, imagePath, productId, skuId) {
    return InkWell(
      onTap: () {
        // Get.to(ParticularProductScreen(
        //     productId: productId, skuId: skuId, category: 'grocery'));
      },
      child: Container(
        height: Constant.height * .24,
        width: Constant.width * .4,
        padding: EdgeInsets.only(
          top: Constant.height * .005,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        margin: EdgeInsets.only(
          top: Constant.height * .01,
          bottom: Constant.height * .01,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        decoration: BoxDecoration(
          color: AppColors.eComCardBg
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image Container
            Container(
              height: Constant.height * .15,
              width: Constant.width * .38,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                      color: AppColors.white, width: Constant.width * .005),
                  borderRadius: BorderRadius.circular(Constant.width * .02),
                  image: DecorationImage(
                      image: NetworkImage(imagePath), fit: BoxFit.cover)),
            ),

            /// dish title ---> Text
            Text(name,
                style: TextStyle(
                    fontSize: Constant.width * .045,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),

            /// dish price ---> Text
            Text(price,
                style: TextStyle(
                    fontSize: Constant.width * .04,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyTextDarkColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  /// Medicine Card
  Widget medicineCard(String name, price, imagePath, productId, skuId) {
    return InkWell(
      onTap: () {
        // Get.to(ParticularProductScreen(
        //     productId: productId, skuId: skuId, category: 'pharmacy'));
      },
      child: Container(
        height: Constant.height * .23,
        width: Constant.width * .4,
        padding: EdgeInsets.only(
          top: Constant.height * .005,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        margin: EdgeInsets.only(
          top: Constant.height * .01,
          bottom: Constant.height * .01,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        decoration: BoxDecoration(
          color: AppColors.eComCardBg
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image Container
            Container(
              height: Constant.height * .15,
              width: Constant.width * .38,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                      color: AppColors.white, width: Constant.width * .005),
                  borderRadius: BorderRadius.circular(Constant.width * .02),
                  image: DecorationImage(
                      image: NetworkImage(imagePath), fit: BoxFit.cover)),
            ),

            /// dish title ---> Text
            Text(name,
                style: TextStyle(
                    fontSize: Constant.width * .05,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),

            /// MG ---> Text
            // Text(mg,
            //     style: TextStyle(
            //         fontSize: Constant.width * .04,
            //         fontWeight: FontWeight.w700,
            //         color: AppColors.greyTextDarkColor),
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis),

            /// about dish ---> Text
            Text(price,
                style: TextStyle(
                    fontSize: Constant.width * .04,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyTextDarkColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
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
