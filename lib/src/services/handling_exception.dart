import 'package:http/http.dart';

import '../util/app_utils.dart';

class HandlingException {
  static bool checkStatusCode(Response response) {
    bool isStatus = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      isStatus = true;
    } else if (response.statusCode == 504) {
      isStatus = false;
      AppUtils.showErrorSnackBar("Connection time out");
    } else if (response.statusCode == 404) {
      isStatus = false;
      AppUtils.showErrorSnackBar("Please check, User Not-found.");
    } else {
      isStatus = false;
    }
    return isStatus;
  }
}
