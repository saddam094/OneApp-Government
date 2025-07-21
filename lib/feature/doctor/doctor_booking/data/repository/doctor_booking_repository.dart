import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class DoctorBookingRepository{
  
  final _apiServices = NetworkApiServices();
  
  Future<dynamic> bookedListApi(Map<String, dynamic> data){
    
    final response = _apiServices.postApi(data, ConstUrl.bookedDoctorList);
    return response;

  }
}