import 'package:api_integration/model/user_model/user_model.dart';
import 'package:api_integration/repository/api_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List userData= [];
  late RxBool loading = false.obs;

  getItems()async{
    try{
      loading(true);
      var response = await ApiRepo.apiGet('posts', '');
      if(response !=null){
        final result = List<Map<String, dynamic>>.from(response);
        final data = result.map((e) => UserData.fromJson(e)).toList();
        userData=data;
        update();
      }
    } catch(e){
      debugPrint(e.toString());
    } finally{
      loading(false);
    }
  }
}