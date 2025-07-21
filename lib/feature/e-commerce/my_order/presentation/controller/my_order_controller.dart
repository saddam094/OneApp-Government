import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/my_order/data/model/my_order_model.dart';
import 'package:one_app/feature/e-commerce/my_order/data/repository/my_order_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class MyOrderController extends GetxController{

  final _api = MyOrderRepository();
  final preferences = UserPreference();

  final rxOrderModel = Rxn<MyOrderModel>();
  final rxRequestStatusOrder = Status.LOADING.obs;

  final isLoadingCancelOrder = false.obs;
  final isLoadingPlaceOrder = false.obs;

  void setRxCartModel(MyOrderModel value) => rxOrderModel.value = value;
  void setRxRequestStatusOrderModel(Status value) => rxRequestStatusOrder.value = value;

  /// Cart List
  void orderListApi() async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      "userId": email
    };

    _api.orderListApi(data).then((response) {

      if(kDebugMode){
        print('Api response received');
        print('response : ${response}');
      }

      try{

        MyOrderModel myOrderModel = MyOrderModel.fromJson(response['body-json']);
        setRxCartModel(myOrderModel);
        setRxRequestStatusOrderModel(Status.COMPLETED);

        if(kDebugMode){
          print('Order list data fetched successfully');
        }

      }catch(e){
        setRxRequestStatusOrderModel(Status.ERROR);
        if(kDebugMode){
          print('Error while fetching order list response : $e');
        }
      }


    }).onError((error, stackTrace) {
      setRxRequestStatusOrderModel(Status.ERROR);
      if(kDebugMode){
        print('Error while parsing order list response : $error');
      }
    });

  }

  /// Order From Cart
  void orderFromCart(List items) async{
    isLoadingPlaceOrder.value = true;
    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'userId': email,
      'items': items
    };

    _api.orderFromCartCartApi(data).then((response) {
      isLoadingPlaceOrder.value = false;
      if(kDebugMode){
        print('Response : $response');
      }

      try{

         if(response['body-json']['statusCode'] == 200){
           
           Utils.toastMessageSuccessful(response['body-json']['body']['message']);
           
         }if(response['body-json']['statusCode'] == 400){
           Utils.toastMessageTop(response['body-json']['body']['message']);
         }else{
           Utils.toastMessageTop(response['body-json']['body']['message']);
         }

      }catch(e){

        if(kDebugMode){
          print('Error While Set E-Commerce Order From Cart Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      isLoadingPlaceOrder.value = false;
      if(kDebugMode){
        print('Error While Fetching E-Commerce Order From Cart Data : $error');
      }
    });

  }

  /// Direct Order
  void orderDirect(String productId, skuId, category, int quantity) async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'productId': productId,
      'skuId': skuId,
      'category': category,
      'quantity': quantity,
      'userId': email
    };

    _api.orderDirectApi(data).then((response) {

    if(kDebugMode){
    print('Response : $response');
    }

    try{

    if(response['body-json']['statusCode'] == 200){

    Utils.toastMessageSuccessful(response['body-json']['body']['message']);

    }if(response['body-json']['statusCode'] == 400){
    Utils.toastMessageTop(response['body-json']['body']['message']);
    }else{
    Utils.toastMessageTop(response['body-json']['body']['message']);
    }

    }catch(e){

    if(kDebugMode){
    print('Error While Set E-Commerce Direct Order Data : $e');
    }
    }

    }).onError((error, stackTrace) {

    if(kDebugMode){
    print('Error While Fetching E-Commerce Direct Order Data : $error');
    }
    });

  }

  /// Cancel Order
  void cancelOrder(String orderId) async{
    isLoadingCancelOrder.value = true;
    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'userId': email,
      'orderId': orderId
    };

    _api.cancelOrderApi(data).then((response) {
      isLoadingCancelOrder.value = false;
      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          setRxRequestStatusOrderModel(Status.LOADING);
          orderListApi();
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

        }if(response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }

      }catch(e){

        if(kDebugMode){
          print('Error While Set E-Commerce Cancel Order Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      isLoadingCancelOrder.value = false;
      if(kDebugMode){
        print('Error While Fetching E-Commerce Cancel Order Data : $error');
      }
    });

  }


}