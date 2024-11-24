import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  final token = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://dev-api.curiocitie.com/api/v1/';
    httpClient.defaultDecoder = (map) {
      return map;
    };

    // Fetch and add token to requests
    getToken();

    // Add Bearer token to headers if token is not null
    httpClient.addRequestModifier<void>((request) async {
      if (token.value != null) {
        request.headers['Authorization'] = 'Bearer ${token.value}';
      }
      return request;
    });
  }

  Future<T> getData<T>(
      String endpoint, T Function(dynamic json) fromJson) async {
    final response = await get(endpoint);
    return _handleResponse(response, fromJson);
  }

  Future<T> postData<T>(
    String endpoint,
    dynamic body,
    T Function(dynamic json) fromJson, {
    Map<String, String>? headers, // Updated type for headers
  }) async {
    try {
      // Add headers if provided
      final response = await post(
        endpoint,
        body,
        headers: headers ?? {},
      );
      return _handleResponse(response, fromJson);
    } catch (e) {
      print('Error in postData: $e');
      rethrow;
    }
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

  void getToken() async {
    token.value = await SharedPreferenceHelper.getToken();
  }
}
