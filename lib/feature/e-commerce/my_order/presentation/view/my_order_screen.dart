import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/my_order/presentation/controller/my_order_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/constant/constant_data.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final orderVM = Get.put(MyOrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // orderVM.orderListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          context: context,
          title: 'My Order',
          backButton: true,
          onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
          top: Constant.height * .01,
        ),
        child: Stack(
          children: [
            /// Main Container
            Container(
                height: Constant.height * .88,
                width: Constant.width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Constant.width * .03),
                      topRight: Radius.circular(Constant.width * .03),
                    )),
                child: Obx(
                      () {
                    switch (orderVM.rxRequestStatusOrder.value) {
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
                        if (orderVM.rxOrderModel.value == null) {
                          return Center(
                            child: Text(
                              'No Data Available',
                              style: TextStyle(fontSize: Constant.width * .06),
                            ),
                          );
                        }
                        return orderVM.rxOrderModel.value!.body.isEmpty
                            ? Center(
                          child: Text('No Order Found',
                              style:
                              TextStyle(fontSize: Constant.width * .05)),
                        )
                            : ListView.builder(
                          itemCount:
                          orderVM.rxOrderModel.value!.body.length,
                          itemBuilder: (context, index) {
                            var item = orderVM.rxOrderModel.value!.body[index];

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
                                              color: AppColors.eComCardBg,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  Constant.width * .02),
                                              border: Border.all(
                                                  color: AppColors.primaryColor,
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
                                                maxLines: 1,
                                                overflow: TextOverflow
                                                    .ellipsis),

                                            /// price and quantity
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('price: ${item.price}', style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor)),

                                                Padding(
                                                  padding: EdgeInsets.only(right: Constant.width * .05),
                                                  child: Text('Qnt: ${item.quantity}', style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor)),
                                                ),
                                              ],
                                            ),

                                            Text('Total Amount :  ${item.totalAmount}', style: TextStyle(fontSize: Constant.width * .05, color: AppColors.greyTextDarkColor)),

                                            /// Remove Button
                                            InkWell(
                                              onTap: () {
                                                orderVM.cancelOrder(item.orderId);
                                              },
                                              child: Container(
                                                height: Constant.height *
                                                    .035,
                                                width: Constant.width * 1,
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .primaryColor,
                                                    borderRadius: BorderRadius
                                                        .circular(Constant
                                                        .width *
                                                        .03),
                                                    border: Border.all(
                                                      color: AppColors
                                                          .greyTextDarkColor,
                                                    )),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text('Cancel Order',
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
                                                        color: AppColors.white,
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
                                  indent: Constant.width * .03,
                                  endIndent: Constant.width * .03,
                                )
                              ],
                            );
                          },
                        );
                    }
                  },
                )),

            Obx(() {
              return orderVM.isLoadingCancelOrder.value ? Container(
                height: Constant.height * .88,
                width: Constant.width * 1,
                color: Colors.blueAccent.shade100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                ),
              ) : const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
