import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/core/resources/constants_manager.dart';

@singleton
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? headers}) {
    return dio.get(
      AppContants.baseUrl + endPoint,
        options: Options(
          headers: headers
        )
        );
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.post(
      AppContants.baseUrl + endPoint,
      data: body,
      options: Options(
        validateStatus: (status) => true,
          headers: headers

      ),
    );
  }
}
