// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:c_commerce_bloc_api_call/src/services/apis.dart';
import 'package:http/http.dart';

import '../services/api_request.dart';

abstract class AuthRepository {
  Future<Response> login(String username, String password);
}

class AuthRepo extends AuthRepository {

  @override
  Future<Response> login(String username, String password) async {
    var body = {"username": username, "password": password};
    return await ApiRequest.postRequest(Apis.login, body);
  }
}
