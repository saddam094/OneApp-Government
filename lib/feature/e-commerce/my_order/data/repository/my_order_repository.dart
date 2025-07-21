import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class MyOrderRepository{
  
  final _apiServices = NetworkApiServices();
  
  Future<dynamic> orderListApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.orderList);
    return response;
  }

  Future<dynamic> orderFromCartCartApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.orderFromCart);
    return response;
  }

  Future<dynamic> orderDirectApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.orderDirect);
    return response;
  }

  Future<dynamic> cancelOrderApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.cancelOrder);
    return response;
  }

}