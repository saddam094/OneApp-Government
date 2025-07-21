import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class DoctorHomeRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> popularDoctorApi(){
    final response = _apiServices.getApi(ConstUrl.popularDoctorList);
    return response;
  }

  Future<dynamic> doctorCategoriesApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.allServicesCategory);
    return response;
  }

}