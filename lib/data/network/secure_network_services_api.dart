import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:my_flutter_template_v2/data/exceptions/app_exceptions.dart';
import 'package:my_flutter_template_v2/data/network/base_api_service.dart';
import 'package:my_flutter_template_v2/utils/const_values.dart';
import 'package:my_flutter_template_v2/utils/contants/api_constant.dart';

class SecureNetworkServicesApi implements BaseApiService {
  static const String _fingerprint = 'YOUR_SHA256_FINGERPRINT'; // Replace with your certificate fingerprint
  static const int _timeout = 30;

  SecureNetworkServicesApi() {
    _configureSSL();
  }

  void _configureSSL() {
    SecurityContext.defaultContext.setTrustedCertificatesBytes(
      File('certificates/root_certificate.pem').readAsBytesSync(),
    );
    HttpClient()
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => false)
      ..findProxy = null;
  }

  Map<String, String> _getSecureHeaders(String? bearer) {
    return {
      'Accept': 'application/json',
      'Authorization': bearer != null ? 'Bearer $bearer' : '',
      'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'DENY',
      'Content-Security-Policy': "default-src 'self'",
      'X-XSS-Protection': '1; mode=block'
    };
  }

  Future<void> _checkCertificate(String url) async {
    try {
      await HttpCertificatePinning.check(
        serverURL: url,
        headerHttp: {},
        sha: SHA.SHA256,
        allowedSHAFingerprints: [_fingerprint],
        timeout: _timeout,
      );
    } catch (e) {
      throw BadRequestException('Certificate verification failed');
    }
  }

  @override
  Future getApi({
    String? requestEnd,
    Map<String, dynamic>? queryParams,
    String? bearer,
  }) async {
    dynamic jsonResponse;
    try {

      final Uri url = Uri.parse('${ApiConstants.apiUrl}/$requestEnd');
      if (!url.scheme.contains('https')) {
        throw BadRequestException('Only HTTPS connections allowed');
      }

      final Uri finalUri = url.replace(queryParameters: queryParams);
      await _checkCertificate(finalUri.toString());

      final response = await http.get(
        finalUri,
        headers: _getSecureHeaders(bearer),
      ).timeout(const Duration(seconds: _timeout));

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
      final url = '${ApiConstants.apiUrl}/$requestEnd';
      if (!Uri.parse(url).scheme.contains('https')) {
        throw BadRequestException('Only HTTPS connections allowed');
      }

      await _checkCertificate(url);

      final response = await http.post(
        Uri.parse(url),
        body: params,
        headers: _getSecureHeaders(bearer),
      ).timeout(const Duration(seconds: _timeout));

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
      if (!Uri.parse(url).scheme.contains('https')) {
        throw BadRequestException('Only HTTPS connections allowed');
      }

      await _checkCertificate(url);

      final response = await http.delete(
        Uri.parse(url),
        headers: _getSecureHeaders(bearer),
      ).timeout(const Duration(seconds: _timeout));

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

    try {
      final dynamic jsonResponse = json.decode(response.body);

      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonResponse;
        case 400:
          return jsonResponse;
        case 401:
          if (jsonResponse['message']?.contains('not yet verified') == true &&
              jsonResponse['data']?['token'] != null) {
            return jsonResponse;
          }
          throw UnauthorisedException(jsonResponse['message']);
        case 403:
          if (jsonResponse['message']?.contains('not yet verified') == true) {
            throw UnauthorisedException(jsonResponse['message']);
          }
          throw UnauthorisedException(jsonResponse['message']);
        case 404:
          if (jsonResponse['success'] == false) {
            throw BadRequestException(jsonResponse['message']);
          }
          return jsonResponse;
        case 500:
          throw FetchDataException(jsonResponse['message']);
        default:
          throw UnauthorisedException();
      }
    } on FormatException {
      throw FetchDataException('Invalid response format');
    }
  }
}