import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    receiveDataWhenStatusError: true,
  ),
)..interceptors;