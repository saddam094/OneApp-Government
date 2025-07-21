import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ParticularServiceManProfileRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> particularServiceManProfileApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularServiceManProfile);
    return response;
  }

  Future<dynamic> savedUnsavedApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.savedUnsaved);
    return response;
  }

  Future<dynamic> serviceManBookingApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.bookServiceMan);
    return response;
  }

  Future<dynamic> cancelBookedServiceManApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.cancelBookedServiceMan);
    return response;
  }

}