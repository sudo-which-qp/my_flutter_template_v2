import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_flutter_template_v2/data/exceptions/app_exceptions.dart';
import 'package:my_flutter_template_v2/data/network/base_api_service.dart';
import 'package:my_flutter_template_v2/utils/const_values.dart';
import 'package:my_flutter_template_v2/utils/contants/api_constant.dart';

class NetworkServicesApi implements BaseApiService {
  @override
  Future getApi({
    String? requestEnd,
    Map<String, dynamic>? queryParams,
    String? bearer,
  }) async {
    dynamic jsonResponse;
    try {
      //
      final Uri url = Uri.parse('${ApiConstants.apiUrl}/$requestEnd');
      final Uri finalUri = url.replace(queryParameters: queryParams);

      final response = await http.get(
        finalUri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
      ).timeout(
        const Duration(seconds: 30),
      );
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  @override
  Future postApi({
    String? requestEnd,
    Map<String?, String?>? params,
    String? bearer,
  }) async {
    dynamic jsonResponse;
    try {
      //
      var url = Uri.decodeFull('${ApiConstants.apiUrl}/$requestEnd');
      final response = await http.post(
        Uri.parse(url),
        body: params,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
      ).timeout(
        const Duration(seconds: 30),
      );
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  @override
  Future deleteApi(
      String url,
      String? bearer,
      ) async {
    dynamic jsonResponse;
    try {
      //
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
      ).timeout(
        const Duration(seconds: 30),
      );
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    logger.i(response.statusCode);
    logger.i(response.body);
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = json.decode(response.body);
        return jsonResponse;
      case 201:
        dynamic jsonResponse = json.decode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = json.decode(response.body);
        return jsonResponse;
      case 401:
        dynamic jsonResponse = json.decode(response.body);
        logger.i('401 Response: $jsonResponse');
        // If it's unverified email case
        if (jsonResponse['message'].contains('not yet verified') &&
            jsonResponse['data']?['token'] != null) {
          logger.i('Unverified email case detected');
          return jsonResponse; // Just return the response for processing
        }
        throw UnauthorisedException(jsonResponse['message']);
      case 403:
        dynamic jsonResponse = json.decode(response.body);
        // When user tries to access something without email verification
        if (jsonResponse['message'].contains('not yet verified')) {
          throw UnauthorisedException(jsonResponse['message']);
        }
        throw UnauthorisedException(jsonResponse['message']);
      case 404:
        dynamic jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == false) {
          throw BadRequestException(jsonResponse['message']);
        }
        return jsonResponse;
      case 500:
        dynamic jsonResponse = json.decode(response.body);
        throw FetchDataException(jsonResponse['message']);
      default:
        throw UnauthorisedException();
    }
  }
}