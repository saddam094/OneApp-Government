import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/services/services_home/data/model/recommended_service_man_list_model.dart';
import 'package:one_app/feature/services/services_home/data/model/service_category_list_model.dart';
import 'package:one_app/feature/services/services_home/data/repository/service_home_repository.dart';

class ServiceHomeController extends GetxController{

  List<Map<String, String>> categoryList = [
    {
      'title': 'Online Tutoring',
      'image': 'assets/images/services/online tutor.png'
    },
    {
      'title': 'Makeup Services',
      'image': 'assets/images/services/makeup services.png'
    },
    {
      'title': 'Cooking',
      'image': 'assets/images/services/cooking.png'
    },
    {
      'title': 'Graphics Design',
      'image': 'assets/images/services/graphics design.png'
    },
    {
      'title': 'Designer',
      'image': 'assets/images/services/designer.png'
    },
    {
      'title': 'Laundry Services',
      'image': 'assets/images/services/laundry services.png'
    },
    {
      'title': 'Stitching Services',
      'image': 'assets/images/services/stitching services.png'
    },
  ];

  final _api = ServiceHomeRepository();
  final rxServiceCategoryModel = Rxn<ServiceCategoryListModel>();
  final rxRequestStatusServiceCategory = Status.LOADING.obs;


  final rxRecommendedListModel = Rxn<RecommendedServiceManListModel>();
  final rxRequestStatusRecommendedList = Status.LOADING.obs;

  void setRxServiceCategoryModel(ServiceCategoryListModel value) => rxServiceCategoryModel.value = value;
  void setRxRequestStatusServiceCategory(Status value) => rxRequestStatusServiceCategory.value = value;

  void setRxRecommendedListModel(RecommendedServiceManListModel value) => rxRecommendedListModel.value = value;
  void setRxRequestStatusRecommendedList(Status value) => rxRequestStatusRecommendedList.value = value;

  void serviceCategoryList() async{

    Map<String, dynamic> data = {
      "id": "services"
    };

    _api.servicesCategoryListApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ServiceCategoryListModel serviceCategoryListModel = ServiceCategoryListModel.fromJson(response['body-json']['body']);
        setRxServiceCategoryModel(serviceCategoryListModel);
        setRxRequestStatusServiceCategory(Status.COMPLETED);

        if(kDebugMode){
          print('Service Category List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusServiceCategory(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Service Category List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusServiceCategory(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Service Category List Data : $error');
      }
    });
  }


  /// Fetch Recommended Service Mam List
  void recommendedServiceManList() async{

    _api.recommendedServiceManListApi().then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        RecommendedServiceManListModel recommendedServiceManListModel = RecommendedServiceManListModel.fromJson(response['body-json']['body']);
        setRxRecommendedListModel(recommendedServiceManListModel);
        setRxRequestStatusRecommendedList(Status.COMPLETED);

        if(kDebugMode){
          print('Recommended Service List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusRecommendedList(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Recommended Service List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusRecommendedList(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Recommended Service List Data : $error');
      }
    });
  }

}