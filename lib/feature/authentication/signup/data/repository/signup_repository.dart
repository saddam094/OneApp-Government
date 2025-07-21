import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class SignupRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> signupApi(Map<String, dynamic> data){

    final response = _apiServices.postApi(data, ConstUrl.register);
    return response;

  }

}