import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/my_cart/presentation/controller/my_cart_controller.dart';
import 'package:one_app/feature/e-commerce/my_order/presentation/controller/my_order_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/rounded_icon_button.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:one_app/res/utils/utils.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final cartVM = Get.put(MyCartController());
  final orderController = Get.put(MyOrderController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cartVM.cartListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          context: context,
          title: 'My Cart',
          backButton: true,
          onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
          top: Constant.height * .01,
        ),
        child: Container(
            height: Constant.height * .778,
            width: Constant.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Constant.width * .03),
                  topRight: Radius.circular(Constant.width * .03),
                )
            ),
            child: Obx(
              () {
                switch (cartVM.rxRequestStatusCart.value) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case Status.ERROR:
                    return Center(
                      child: Text(
                        'Something Went Wrong',
                        style: TextStyle(fontSize: Constant.width * .06),
                      ),
                    );

                  case Status.COMPLETED:
                    if (cartVM.rxCartModel.value == null) {
                      return Center(
                        child: Text(
                          'No Data Available',
                          style: TextStyle(fontSize: Constant.width * .06),
                        ),
                      );
                    }
                    return cartVM.rxCartModel.value!.products.isEmpty
                        ? Center(
                            child: Text('Cart is empty',
                                style:
                                    TextStyle(fontSize: Constant.width * .05)),
                          )
                        : ListView.builder(
                            itemCount:
                                cartVM.rxCartModel.value!.products.length,
                            itemBuilder: (context, index) {
                              var item =
                                  cartVM.rxCartModel.value!.products[index];

                              Map<String, dynamic> itemDetailsForOrder = {
                                "quantity": item.quantity,
                                "productId": item.productId,
                              };

                              if (cartVM.arr.isEmpty) {
                                cartVM.arr.add(itemDetailsForOrder);
                              } else {
                                if (isContain(cartVM.arr, itemDetailsForOrder)) {
                                  if (cartVM.indexOfElement != MyCartController.constantValue) {
                                    cartVM.arr.removeAt(cartVM.indexOfElement);
                                    cartVM.indexOfElement = MyCartController.constantValue;
                                  }
                                  cartVM.arr.add(itemDetailsForOrder);
                                }
                              }

                              if (kDebugMode) {
                                print("Array Data : ${cartVM.arr}");
                              }

                              return Column(
                                children: [
                                  Container(
                                    height: Constant.height * .15,
                                    width: Constant.width * 1,
                                    padding: EdgeInsets.only(
                                      left: Constant.width * .03,
                                      right: Constant.width * .03,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Image
                                        InkWell(
                                          onTap: () {
                                            // Get.to(() =>
                                            //     ParticularProductScreen(
                                            //         productId: item
                                            //             .productId
                                            //             .toString()));
                                          },
                                          child: Container(
                                            height: Constant.height * .13,
                                            width: Constant.width * .26,
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .eComCardBg,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Constant.width * .02),
                                              border: Border.all(
                                                color: AppColors.white,
                                                width: Constant.width * .005
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(item.image.toString()),
                                                  fit: BoxFit.cover
                                              )
                                            ),
                                          ),
                                        ),

                                        /// Content
                                        SizedBox(
                                          height: Constant.height * .15,
                                          width: Constant.width * .62,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              /// Title
                                              Text(
                                                  item.productName
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constant.width *
                                                              .045, color: AppColors.black, fontWeight: FontWeight.bold),
                                                  maxLines: 2,
                                                  overflow: TextOverflow
                                                      .ellipsis),

                                              /// price and quantity
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('${item.price}',
                                                      style: TextStyle(
                                                          fontSize: Constant
                                                                  .width *
                                                              .05,
                                                          color: AppColors
                                                              .greyTextDarkColor)),
                                                  Container(
                                                    height:
                                                        Constant.height *
                                                            .04,
                                                    width: Constant.width *
                                                        .31,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(Constant
                                                                    .width *
                                                                .05),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        /// minus Icon
                                                        RoundedIconButton(
                                                            icon: Icons
                                                                .remove,
                                                            onPress: () {
                                                              int quantity = item
                                                                  .quantity
                                                                  .toInt();
                                                              if (quantity !=
                                                                  1) {
                                                                cartVM.updateQuantityFromCartApi('false', item.productId);
                                                              } else {
                                                                Utils.toastMessageTop(
                                                                    'this is the least quantity');
                                                              }
                                                            },
                                                            iconSize: Constant
                                                                    .width *
                                                                .04),

                                                        /// Text --> Quantity
                                                        Text(
                                                            item.quantity
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    Constant.width *
                                                                        .05, color: AppColors.primaryColor)),

                                                        /// Plus Icon
                                                        RoundedIconButton(
                                                            icon: Icons.add,
                                                            onPress: () {
                                                              // int quantity = item.quantity.toInt();
                                                              cartVM.updateQuantityFromCartApi('true', item.productId);
                                                            },
                                                            iconSize: Constant
                                                                    .width *
                                                                .04),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(
                                                  height: Constant.height *
                                                      .01),

                                              /// Remove Button
                                              InkWell(
                                                onTap: () {
                                                  cartVM.removeFromCart(item.productId);
                                                },
                                                child: Container(
                                                  height: Constant.height *
                                                      .035,
                                                  width: Constant.width * 1,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius: BorderRadius.circular(Constant.width * .03),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Remove',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Constant.width *
                                                                      .05,
                                                              color: AppColors
                                                                  .white)),
                                                      SizedBox(
                                                          width: Constant
                                                                  .width *
                                                              .02),
                                                      Icon(
                                                          Icons
                                                              .delete_forever_outlined,
                                                          color: AppColors
                                                              .primaryColor,
                                                          size: Constant
                                                                  .width *
                                                              .05),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  /// Divider
                                  Divider(
                                    color: AppColors.primaryYellowColor,
                                    indent: Constant.width * .05,
                                    endIndent: Constant.width * .05,
                                  )
                                ],
                              );
                            },
                          );
                }
              },
            )),
      ),
      bottomSheet: Obx(
        () {
          if (cartVM.rxRequestStatusCart.value == Status.COMPLETED) {
            return cartVM.rxCartModel.value!.products.isEmpty
                ? Container(
                    height: Constant.height * .08,
                    width: Constant.width * 1,
                    color: AppColors.eComCardBg,
                  )
                : Container(
                    height: Constant.height * .08,
                    width: Constant.width * 1,
                    color: AppColors.primaryGreyColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Constant.width * .03,
                        right: Constant.width * .03,
                        top: Constant.height * .005,
                        bottom: Constant.height * .005,
                      ),
                      child: Obx(
                        () {
                          return cartVM.rxRequestStatusCart.value ==
                                  Status.COMPLETED
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// Total Amount
                                    Column(
                                      children: [
                                        Text('Total Amount',
                                            style: TextStyle(
                                                fontSize: Constant.width * .05,
                                                color: AppColors
                                                    .black,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            // cartVM.rxCartModel.value!.totalCartPrice
                                            //     .toStringAsFixed(2),
                                            cartVM.rxCartModel.value!.totalAmount.toString(),
                                            style: TextStyle(
                                                fontSize: Constant.width * .05,
                                                color: AppColors.primaryYellowColor,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing:
                                                    Constant.width * .005)),
                                      ],
                                    ),

                                    /// Place Order Button
                                    CommonButton(
                                      height: Constant.height * .06,
                                      width: Constant.width * .4,
                                      title: 'Place Order',
                                      isEnabled: false,
                                      isLoading: orderController.isLoadingPlaceOrder.value,
                                      onTap: () {
                                        orderController.orderFromCart(cartVM.arr);
                                      },
                                    )
                                  ],
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
                  );
          }

          return SizedBox();
        },
      ),
    );
  }

  bool isContain(var arr, Map item) {
    for (int a = 0; a < arr.length; a++) {
      if (item['productId'] == arr[a]['productId']) {
        if (kDebugMode) {
          print('Item Already Exist');
        }
        if (item['quantity'] != arr[a]['quantity']) {
          cartVM.indexOfElement = a;
          return true;
        }
        return false;
      }
    }
    return true;
  }
}
