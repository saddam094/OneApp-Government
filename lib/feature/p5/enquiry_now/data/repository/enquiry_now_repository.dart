import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class EnquiryNowRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> enquiryNowApi(Map<String, dynamic> data){

    final response = _apiServices.postApi(data, ConstUrl.enquiryNow);
    return response;

  }

}