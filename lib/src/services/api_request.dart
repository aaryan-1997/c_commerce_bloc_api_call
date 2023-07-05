import 'package:c_commerce_bloc_api_call/src/services/apis.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static Future<http.Response> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse("${Apis.baseUrl}$url"));
    return response;
  }

  static Future<http.Response> postRequest(String url, body) async {
    http.Response response =
        await http.post(Uri.parse("${Apis.baseUrl}$url"), body: body);
    return response;
  }
}
