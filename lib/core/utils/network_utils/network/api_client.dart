import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<dynamic> get(String endpoint);
  Future<dynamic> post(String endpoint, {required dynamic body});
  Future<dynamic> put(String endpoint, {required dynamic body});
  Future<dynamic> delete(String endpoint);
}

class ApiClientImpl implements ApiClient {
  final String baseUrl;
  final http.Client httpClient;

  ApiClientImpl({required this.baseUrl, required this.httpClient});

  Future<Map<String, String>> getHeaders() async {
    // Example: Add authentication headers if needed
    return {
      'Content-Type': 'application/json',
      // ...
    };
  }

  @override
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await httpClient.get(Uri.parse('$baseUrl$endpoint'), headers: await getHeaders());
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> post(String endpoint, {required dynamic body}) async {
    try {
      final response = await httpClient.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: await getHeaders(),
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> put(String endpoint, {required dynamic body}) async {
    try {
      final response = await httpClient.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: await getHeaders(),
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await httpClient.delete(Uri.parse('$baseUrl/$endpoint'), headers: await getHeaders());
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;

    print('zzzzzzz ${response.statusCode}');
    print('zzzzzzz ${response.body}');
    print('zzzzzzz ${response.request?.url}');

    if (statusCode < 200 || statusCode >= 400 || json == null) {
      throw Exception('Error while fetching data: ${response.reasonPhrase}');
    }

    return jsonDecode(responseBody);
  }

  dynamic _handleError(dynamic error) {
    print('Request error: $error');
    throw Exception('Error occurred: $error');
  }
}
