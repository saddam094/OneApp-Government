import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/doctor/doctor_home/data/model/doctor_category_model.dart';
import 'package:one_app/feature/doctor/doctor_home/data/model/popular_doctor_model.dart';
import 'package:one_app/feature/doctor/doctor_home/data/repository/doctor_home_repository.dart';

class DoctorHomeController extends GetxController{

  final _api = DoctorHomeRepository();

  /// Popular Doctor
  final rxPopularDoctorModel = Rxn<PopularDoctorModel>();
  final rxRequestStatusPopularDoctor = Status.LOADING.obs;

  void setRxPopularDoctorModel(PopularDoctorModel value) => rxPopularDoctorModel.value = value;
  void setRxRequestStatusPopularDoctor(Status value) => rxRequestStatusPopularDoctor.value = value;

  /// Doctor Category
  final rxDoctorCategoryModel = Rxn<DoctorCategoryModel>();
  final rxRequestStatusDoctorCategory = Status.LOADING.obs;

  void setRxDoctorCategoryModel(DoctorCategoryModel value) => rxDoctorCategoryModel.value = value;
  void setRxRequestStatusDoctorCategory(Status value) => rxRequestStatusDoctorCategory.value = value;

  /// Popular Doctor List Method
  void popularDoctorList(){

    _api.popularDoctorApi().then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        PopularDoctorModel popularDoctorModel = PopularDoctorModel.fromJson(response['body-json']);
        setRxPopularDoctorModel(popularDoctorModel);
        setRxRequestStatusPopularDoctor(Status.COMPLETED);

        if(kDebugMode){
          print('Popular Doctor List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPopularDoctor(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPopularDoctor(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching data : $error');
      }
    });

  }

  /// Doctor Category Method
  void doctorCategoryList(){

    Map<String, dynamic> data = {
      'id': 'doctor'
    };

    _api.doctorCategoriesApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        DoctorCategoryModel doctorCategoryModel = DoctorCategoryModel.fromJson(response['body-json']['body']);
        setRxDoctorCategoryModel(doctorCategoryModel);
        setRxRequestStatusDoctorCategory(Status.COMPLETED);

        if(kDebugMode){
          print('Doctor Category List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusDoctorCategory(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Doctor Category Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusDoctorCategory(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Doctor Category Data : $error');
      }
    });

  }

}