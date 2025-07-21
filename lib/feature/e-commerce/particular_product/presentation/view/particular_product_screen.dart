import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/e-commerce/my_cart/presentation/controller/my_cart_controller.dart';
import 'package:one_app/feature/e-commerce/particular_product/presentation/controller/particular_product_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/rounded_icon_button.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ParticularProductScreen extends StatefulWidget {
  // final String productId;
  // final String skuId;
  // final String category;
  const ParticularProductScreen({super.key,
    // required this.productId, required this.skuId, required this.category
  });

  @override
  State<ParticularProductScreen> createState() =>
      _ParticularProductScreenState();
}

class _ParticularProductScreenState extends State<ParticularProductScreen> {
  final cartController = Get.put(MyCartController());
  final particularProductVM = Get.put(ParticularProductController());

  String selected = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // particularProductVM.particularProductApi(widget.productId, widget.skuId, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        context: context,
        title: 'Details',
        backButton: true,
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          /// Main Content
          SingleChildScrollView(
            child: Obx(() {
              return Padding(
                padding: EdgeInsets.only(
                    left: Constant.width * .03,
                    right: Constant.width * .03,
                    top: Constant.height * .01
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// image Container
                    // particularProductVM
                    //     .rxParticularProductModel.value!.images.isEmpty
                    //     ? Container(
                    //   height: Constant.height * .3,
                    //   width: Constant.width * 1,
                    //   decoration: BoxDecoration(
                    //     color: AppColors.white,
                    //     borderRadius: BorderRadius.circular(
                    //         Constant.width * .08),
                    //   ),
                    //   child: Center(
                    //     child: Text('No Image Available',
                    //         style: TextStyle(
                    //             fontSize: Constant.width * .05)),
                    //   ),
                    // )
                    //     :
                    Container(
                      height: Constant.height * .3,
                      width: Constant.width * 1,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(index % 2 == 0 ? 'assets/images/products/cloth.png' : 'assets/images/products/honey.png');
                        },
                        // itemCount: particularProductVM.rxParticularProductModel.value!.images.length,
                        itemCount: 2,
                        pagination: SwiperPagination(),
                        control: SwiperControl(),
                      ),
                    ),

                    SizedBox(height: Constant.height * .015),

                    /// Title Text
                    Text('Mens Harrington Jacket',
                        style: TextStyle(fontSize: Constant.width * .045,fontWeight: FontWeight.bold, color: AppColors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),

                    SizedBox(height: Constant.height * .005),

                    // Row(
                    //   children: [
                    //     /// Star Icon
                    //     Icon(Icons.star, color: AppColors.yellowColor, size: Constant.width * .07),
                    //
                    //     SizedBox(width: Constant.width * .02),
                    //
                    //     /// rating
                    //     Text(' 0.0', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.greyTextDarkColor),)
                    //   ],
                    // ),
                    //
                    // SizedBox(height: Constant.height * .005),

                    /// Price and Item Counter
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        /// Price
                        Text('price : 550',
                          style: TextStyle(
                              fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.productsGradient2),
                        ),

                        /// Add_box, Counter, Minus_box
                        Row(
                          children: [
                            /// Icon minus
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                if (particularProductVM
                                    .rxCounter.value !=
                                    1) {
                                  particularProductVM.rxCounter
                                      .value = particularProductVM
                                      .rxCounter.value -
                                      1;
                                }
                              },
                              iconSize: Constant.width * .05,
                            ),

                            /// Count Text
                            Text(
                                particularProductVM
                                    .rxCounter.value
                                    .toString(),
                                style: TextStyle(
                                    fontSize:
                                    Constant.width * .05,
                                    fontWeight: FontWeight.w600, color: AppColors.productsGradient2)),

                            /// Icon add
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                particularProductVM.rxCounter
                                    .value = particularProductVM
                                    .rxCounter.value +
                                    1;
                              },
                              iconSize: Constant.width * .05,
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: Constant.height * .01),

                    /// Size
                    Obx(() {
                      return Container(
                        height: Constant.height * .06,
                        width: Constant.width * 1,
                        padding: EdgeInsets.only(
                            left: Constant.width * .03,
                            right: Constant.width * .03
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Constant.width * .02),
                            border: Border.all(
                                color: AppColors.productsGradient1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Size : ' ),

                            DropdownButton<String>(
                              value: particularProductVM.size.value,
                              hint: Text('Select Size'),
                              items: ['-- select size --', 'S', 'M', 'L', 'XL', 'XXL'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                particularProductVM.size.value = value!;
                              },
                            ),
                          ],
                        ),
                      );
                    },),

                    SizedBox(height: Constant.height * .01),

                    /// Color
                    Obx(() {
                      return Container(
                        height: Constant.height * .06,
                        width: Constant.width * 1,
                        padding: EdgeInsets.only(
                            left: Constant.width * .03,
                            right: Constant.width * .03
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Constant.width * .02),
                            border: Border.all(
                                color: AppColors.productsGradient1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Colour : ' ),

                            DropdownButton<String>(
                              value: particularProductVM.color.value,
                              hint: Text('Select Category'),
                              items: ['-- select color --', 'White', 'Black', 'Grey'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                particularProductVM.color.value = value!;
                              },
                            ),
                          ],
                        ),
                      );
                    },),

                    SizedBox(height: Constant.height * .01),

                    /// Description
                    Text('Description',
                        style: TextStyle(fontSize: Constant.width * .045, fontWeight: FontWeight.bold, color: AppColors.black)),

                    SizedBox(height: Constant.height * .01),

                    Text(
                        'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless. Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
                        style: TextStyle(
                            fontSize: Constant.width * .04,
                            color: AppColors.greyTextLightColor),
                        maxLines: 25,
                        overflow: TextOverflow.ellipsis),

                    SizedBox(
                      height: Constant.height * .13,
                    )
                  ],
                ),
              );
            },),
            // child: Padding(
            //     padding: EdgeInsets.only(
            //       left: Constant.width * .025,
            //       right: Constant.width * .025,
            //     ),
            //     child: Obx(
            //       () {
            //         switch (particularProductVM.rxRequestStatus.value) {
            //           case Status.LOADING:
            //             return const Center(
            //               child: CircularProgressIndicator(),
            //             );
            //
            //           case Status.ERROR:
            //             return Center(
            //               child: Text(
            //                 'Something Went Wrong',
            //                 style: TextStyle(fontSize: Constant.width * .06),
            //               ),
            //             );
            //
            //           case Status.COMPLETED:
            //             if (particularProductVM.rxParticularProductModel.value ==
            //                 null) {
            //               return Center(
            //                 child: Text(
            //                   'No Data Available',
            //                   style: TextStyle(fontSize: Constant.width * .06),
            //                 ),
            //               );
            //             }
            //             var data = particularProductVM.rxParticularProductModel.value!;
            //             return Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 /// image Container
            //                 particularProductVM
            //                         .rxParticularProductModel.value!.images.isEmpty
            //                     ? Container(
            //                         height: Constant.height * .3,
            //                         width: Constant.width * 1,
            //                         decoration: BoxDecoration(
            //                           color: AppColors.white,
            //                           borderRadius: BorderRadius.circular(
            //                               Constant.width * .08),
            //                         ),
            //                         child: Center(
            //                           child: Text('No Image Available',
            //                               style: TextStyle(
            //                                   fontSize: Constant.width * .05)),
            //                         ),
            //                       )
            //                     :
            //                 Container(
            //                   height: Constant.height * .3,
            //                   width: Constant.width * 1,
            //                   decoration: BoxDecoration(
            //                     // color: AppColors.eComCardBg
            //                   ),
            //                   child: Swiper(
            //                     itemBuilder: (BuildContext context, int index) {
            //                       return Image.network(particularProductVM.rxParticularProductModel.value!.images[index]);
            //                     },
            //                     itemCount: particularProductVM
            //                         .rxParticularProductModel.value!.images.length,
            //                     pagination: SwiperPagination(),
            //                     control: SwiperControl(),
            //                   ),
            //                 ),
            //
            //                 SizedBox(height: Constant.height * .015),
            //
            //                 /// Title Text
            //                 Text(data.productName.toString(),
            //                     style: TextStyle(fontSize: Constant.width * .05,fontWeight: FontWeight.bold, color: AppColors.black),
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis),
            //
            //                 SizedBox(height: Constant.height * .005),
            //
            //                 Row(
            //                   children: [
            //                     /// Star Icon
            //                     Icon(Icons.star, color: AppColors.yellowColor, size: Constant.width * .07),
            //
            //                     SizedBox(width: Constant.width * .02),
            //
            //                     /// rating
            //                     Text(data.rating.toString(), style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.greyTextDarkColor),)
            //                   ],
            //                 ),
            //
            //                 SizedBox(height: Constant.height * .005),
            //
            //                 /// Price and Item Counter
            //                 Row(
            //                   mainAxisAlignment:
            //                   MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     /// Price
            //                     Text('price : ${data.price.toString()}',
            //                       style: TextStyle(
            //                           fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.greyTextDarkColor),
            //                     ),
            //
            //                     /// Add_box, Counter, Minus_box
            //                     Row(
            //                       children: [
            //                         /// Icon minus
            //                         RoundedIconButton(
            //                           icon: Icons.remove,
            //                           onPress: () {
            //                             if (particularProductVM
            //                                 .rxCounter.value !=
            //                                 1) {
            //                               particularProductVM.rxCounter
            //                                   .value = particularProductVM
            //                                   .rxCounter.value -
            //                                   1;
            //                             }
            //                           },
            //                           iconSize: Constant.width * .05,
            //                         ),
            //
            //                         /// Count Text
            //                         Text(
            //                             particularProductVM
            //                                 .rxCounter.value
            //                                 .toString(),
            //                             style: TextStyle(
            //                                 fontSize:
            //                                 Constant.width * .05,
            //                                 fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
            //
            //                         /// Icon add
            //                         RoundedIconButton(
            //                           icon: Icons.add,
            //                           onPress: () {
            //                             particularProductVM.rxCounter
            //                                 .value = particularProductVM
            //                                 .rxCounter.value +
            //                                 1;
            //                           },
            //                           iconSize: Constant.width * .05,
            //                         ),
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //
            //                 SizedBox(height: Constant.height * .01),
            //
            //                 /// Divider -3
            //                 Divider(
            //                   color: AppColors.primaryColor,
            //                   indent: Constant.width * .01,
            //                   endIndent: Constant.width * .01,
            //                 ),
            //
            //                 SizedBox(height: Constant.height * .01),
            //
            //                 /// Description
            //                 Text('Description',
            //                     style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.primaryYellowColor)),
            //
            //                 Text(
            //                     particularProductVM.rxParticularProductModel.value!.description.toString(),
            //                     style: TextStyle(
            //                         fontSize: Constant.width * .05,
            //                         color: AppColors.greyTextLightColor),
            //                     maxLines: 25,
            //                     overflow: TextOverflow.ellipsis),
            //
            //                 SizedBox(
            //                   height: Constant.height * .11,
            //                 )
            //               ],
            //             );
            //         }
            //       },
            //     )),
          ),

          /// Add To Cart Button
          Positioned(
            top: Constant.height * .75,
            left: Constant.width * .08,
            child: InkWell(
              onTap: () {

              },
              child: Container(
                height: Constant.height * .06,
                width: Constant.width * .85,
                padding: EdgeInsets.only(
                  left: Constant.width * .06,
                  right: Constant.width * .06,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.productsGradient2,
                      AppColors.productsGradient1
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(Constant.width * .08),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Price
                    Obx(
                          () {
                        return Text(
                            '₹ ${(550 *
                                particularProductVM.rxCounter.value)
                                .toStringAsFixed(0)}',
                            style: TextStyle(
                                fontSize: Constant.width * .045,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white)
                        );
                      },
                    ),

                    /// Text ---> Add To Cart
                    Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: Constant.width * .045,
                            color: AppColors.white)
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomSheet: Container(
      //   height: Constant.height * .06,
      //   width: Constant.width * 1,
      //   padding: EdgeInsets.only(
      //     left: Constant.width * .03,
      //     right: Constant.width * .03,
      //   ),
      //   // decoration: BoxDecoration(
      //   //   color: AppColors.primaryGreyColor,
      //   // ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //
      //       InkWell(
      //         onTap: () {
      //
      //         },
      //         child: Container(
      //           height: Constant.height * .06,
      //           width: Constant.width * .85,
      //           padding: EdgeInsets.only(
      //             left: Constant.width * .06,
      //             right: Constant.width * .06,
      //           ),
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               colors: [
      //                 AppColors.productsGradient2,
      //                 AppColors.productsGradient1
      //               ],
      //               begin: Alignment.topCenter,
      //               end: Alignment.bottomCenter,
      //             ),
      //             borderRadius: BorderRadius.circular(Constant.width * .08),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               /// Price
      //               Obx(
      //                     () {
      //                   return Text(
      //                       '₹ ${(550 *
      //                           particularProductVM.rxCounter.value)
      //                           .toStringAsFixed(0)}',
      //                       style: TextStyle(
      //                           fontSize: Constant.width * .045,
      //                           fontWeight: FontWeight.bold,
      //                           color: AppColors.white)
      //                   );
      //                 },
      //               ),
      //
      //               /// Text ---> Add To Cart
      //               Text(
      //                   'Add to Cart',
      //                   style: TextStyle(
      //                       fontSize: Constant.width * .045,
      //                       color: AppColors.white)
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //
      //       /// content
      //       // Column(
      //       //   mainAxisAlignment: MainAxisAlignment.center,
      //       //   crossAxisAlignment: CrossAxisAlignment.start,
      //       //   children: [
      //       //     Text('Total Price',
      //       //         style: TextStyle(
      //       //             fontSize: Constant.width * .05,
      //       //             color: AppColors.black)
      //       //     ),
      //       //
      //       //     Obx(
      //       //       () {
      //       //         return Text(
      //       //                 (550 *
      //       //                         particularProductVM.rxCounter.value)
      //       //                     .toStringAsFixed(2),
      //       //                 style: TextStyle(
      //       //                     fontSize: Constant.width * .05,
      //       //                     color: AppColors.primaryYellowColor));
      //       //       },
      //       //     ),
      //       //   ],
      //       // ),
      //       //
      //       // /// Button
      //       // InkWell(
      //       //   onTap: () {
      //       //     /// Add To Cart
      //       //     // cartController.addToCart(widget.productId, widget.skuId, widget.category, particularProductVM.rxCounter.value);
      //       //
      //       //     /// Call Now
      //       //     var phone = particularProductVM.rxParticularProductModel.value!.ownerPhone;
      //       //     launchUrlString('tel://$phone');
      //       //   },
      //       //   child: Container(
      //       //     height: Constant.height * .06,
      //       //     width: Constant.width * .4,
      //       //     decoration: BoxDecoration(
      //       //       color: AppColors.primaryColor,
      //       //       borderRadius: BorderRadius.circular(Constant.width * .1),
      //       //     ),
      //       //     child: Center(
      //       //         child: Text(
      //       //       'Call Now',
      //       //       style: TextStyle(
      //       //           fontSize: Constant.width * .05,
      //       //           color: AppColors.white,
      //       //           fontWeight: FontWeight.w600),
      //       //     )),
      //       //   ),
      //       // )
      //     ],
      //   ),
      // ),
    );
  }
}

class ParticularSpecification extends StatelessWidget {
  final String specification;
  final String value;
  const ParticularSpecification(
      {super.key, required this.specification, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Constant.width * .02,
        right: Constant.width * .02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(specification,
              style: TextStyle(
                  fontSize: Constant.width * .05,
                  color: AppColors.greyTextLightColor)),
          SizedBox(
              width: Constant.width * .5,
              child: Text(value,
                  style: TextStyle(fontSize: Constant.width * .05))),
        ],
      ),
    );
  }
}
