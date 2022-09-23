// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:api_integration/view/catagory/model/dummy_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../services/dummy_api_repo.dart';

class CartController extends GetxController {
  List cartItems = [];
  late RxBool isLoading = false.obs;

 

  getCartItems() async {
    try {
      isLoading(true);
      var response = await ApiRepo.apiGet('posts', '');
      if (response != null) {
        final result = List<Map<String, dynamic>>.from(response);
        final mapdata = result.map((e) => ApiRepoModel.fromJson(e)).toList();
        cartItems = mapdata;
        update();
      }
    } catch (e) {
      const Text("Error");
    } finally{
      isLoading(false);
    }
  }
}
