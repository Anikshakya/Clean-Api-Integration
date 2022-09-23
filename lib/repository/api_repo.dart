import 'dart:developer';
import 'package:api_integration/common/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRepo{
  static apiPost(apiPath,params) async {
    try {
      var response = await dio.post(apiPath, data: params);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('QueryParameters => '+ params.toString());
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if(e.response!.data.containsKey('errors')){
        // showToastMessage(e.response!.data['errors'].toString());
      }
      else{
        // showToastMessage(e.response!.data['message'].toString());
        log(e.response!.data['message'].toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static apiGet(apiPath,queryParameters) async {
    try {
      var response = await dio.get(apiPath, queryParameters: queryParameters==''?{}:queryParameters);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('QueryParameters => '+ queryParameters.toString());
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // showToastMessage(e.response!.data['message'].toString());
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
  }
  
  static apiPut(apiPath,queryParameters) async {
    try {
      var response = await dio.put(apiPath, data: queryParameters);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('QueryParameters => '+ queryParameters.toString());
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // showToastMessage(e.response!.data['message'].toString());
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  static apiDelete(apiPath) async {
    try {
      var response = await dio.delete(apiPath);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // showToastMessage(e.response!.data['message'].toString());
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  //upload image
  static apiUploadImage(apiPath,image) async{
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          image!.path,
        ),
      });
      var response = await dio.post(apiPath, data: formData);
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      // showToastMessage(e.response!.data['message']);
    } catch (e) {
      log(e.toString());
    }
  }

  //use for json data controller
  static apiJsonGet(apiPath) async {
    try {
      var response = await dio.get(apiPath);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      // showToastMessage(e.toString());
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
  }


  static apiPatch(apiPath,queryParameters) async {
    try {
      var response = await dio.patch(apiPath, data: queryParameters);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('ApiPath => '+ apiPath);
          print('QueryParameters => '+ queryParameters.toString());
          print('Response => ' +response.toString());
        }
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // showToastMessage(e.response!.data['message'].toString());
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

