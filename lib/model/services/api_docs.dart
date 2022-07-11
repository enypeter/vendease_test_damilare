import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/model.dart';
import 'internet_services.dart';

class ApiDocs {
  static const String url =
      "https://live-vendease.herokuapp.com/product?\$limit=10&&name[\$search]=co&\$skip=0&cityCode=LA724629&countryCode=NI904222";

  static getProducts() async {
    return await initialiseGetRequest(url);
  }

  static makeGetRequest({apiUrl, token}) async {
    var uri = Uri.parse(apiUrl);
    var
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json'
      };

    return await http.get(uri, headers: headers);
  }

  static initialiseGetRequest(String url) async {
    // if (await InternetUtils.checkConnectivity()) {
      try {
        var response = await ApiDocs.makeGetRequest(apiUrl: url);

        if (isRequestSuccessful(response.statusCode)) {
          var body = jsonDecode(response.body);
          return ResponseModel.fromJson(body);
        } else {
          if (response.statusCode == 400) {
            // Dialogs.showErrorSnackBar(
            //     'Oops!', 'Something went wrong, Kindly log in again');
            // Get.offAll(() => OnboardScreen());
          } else {
            return handleError(response);
          }
        }
      } catch (e) {
        return e.toString();
      }
    // } else {
    //   return 'Check your internet connection';
    // }
  }

  static isRequestSuccessful(int? statusCode) {
    return statusCode! >= 200 && statusCode < 300;
  }

  static handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw (jsonDecode(response.body)['message']);

      case 401:
        throw 'Unauthorized - ${jsonDecode(response.body)['message']}';

      case 403:
        throw 'Forbidden - ${jsonDecode(response.body)['message']}';

      case 404:
        throw 'Not found - ${jsonDecode(response.body)['message']}';

      case 422:
        throw 'Unable to process - ${jsonDecode(response.body)['message']}';

      case 500:
        throw 'Server - ${jsonDecode(response.body)['message']}';
      default:
        throw 'Error occurred with code : ${response.statusCode} ${response.request!.url} ${response.body}';
    }
  }
}
