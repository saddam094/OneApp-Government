import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ParticularDoctorDetailsRepository{
  
  final _apiServices = NetworkApiServices();
  
  Future<dynamic> particularDoctorDetailsApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularDoctorDetails);
    return response;
  }

  Future<dynamic> bookAppointmentApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.doctorBookingAppointment);
    return response;
  }
  
}