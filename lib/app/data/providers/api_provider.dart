import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://dev-api.curiocitie.com/api/v1/';

    httpClient.defaultDecoder = (map) {
      return map;
    };
    super.onInit();
  }

  Future<T> getData<T>(
      String endpoint, T Function(dynamic json) fromJson) async {
    final response = await get(endpoint);
    return _handleResponse(response, fromJson);
  }

  Future<T> postData<T>(
      String endpoint, dynamic body, T Function(dynamic json) fromJson) async {
    final response = await post(endpoint, body);
    return _handleResponse(response, fromJson);
  }

  Future<T> putData<T>(
      String endpoint, dynamic body, T Function(dynamic json) fromJson) async {
    final response = await put(endpoint, body);
    return _handleResponse(response, fromJson);
  }

  Future<T> patchData<T>(
      String endpoint, dynamic body, T Function(dynamic json) fromJson) async {
    final response = await patch(endpoint, body);
    return _handleResponse(response, fromJson);
  }

  Future<T> deleteData<T>(
      String endpoint, T Function(dynamic json) fromJson) async {
    final response = await delete(endpoint);
    return _handleResponse(response, fromJson);
  }

  T _handleResponse<T>(Response response, T Function(dynamic json) fromJson) {
    if (response.hasError) {
      throw Exception(response.statusText ?? 'Error fetching data');
    }
    return fromJson(response.body);
  }
}
