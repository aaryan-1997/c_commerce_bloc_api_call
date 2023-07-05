import 'package:c_commerce_bloc_api_call/src/services/api_request.dart';
import 'package:http/http.dart';

import '../services/apis.dart';

abstract class HomeRepository {
  Future<Response> fetchProduct();
  Future<Response> fetchCategory();
}

class HomeRepo extends HomeRepository {
  @override
  Future<Response> fetchProduct() async {
    return await ApiRequest.getRequest(Apis.products);
  }

  @override
  Future<Response> fetchCategory() async {
    return await ApiRequest.getRequest(Apis.categories);
  }
}
