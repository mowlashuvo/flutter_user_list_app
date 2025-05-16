// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../util/constant.dart';
import 'exception.dart';
// import 'api_exception.dart';

class BaseApiClient {
  static const int timeOutDuration = 20;

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint)
        .replace(queryParameters: queryParams);
    try {
      log('\x1B[92m(get) requesting URL: $uri');
      final response = await http
          .get(uri, headers: await _setHeader())
          .timeout(const Duration(seconds: timeOutDuration));
      log('\x1B[95mResponse status code: ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      return _handleException(e, uri.toString());
    }
  }

  Future<dynamic> post({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);

    try {
      log('\x1B[92m(post) requesting URL: $uri');
      print(data);

      final response = await http
          .post(
            uri,
            body: jsonEncode(data),
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      print('error');

      // ignore: prefer_adjacent_string_concatenation
      log("\x1B[92m(post) requesting URL: $uri" +
          "\n" +
          "\x1B[95mResponse status code: ${response.statusCode.toString()}" +
          "\n" +
          jsonEncode(data) +
          "\n");
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

  Future<dynamic> put({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);
    try {
      log('\x1B[92m(put) requesting URL: $uri');
      final response = await http
          .put(
            uri,
            body: jsonEncode(data),
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

  Future<dynamic> delete({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);
    final dataJson = json.encode(data);

    try {
      log('\x1B[92m(post) requesting URL: $uri');
      log(jsonEncode(data));
      final response = await http
          .delete(
            uri,
            body: dataJson,
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      log('\x1B[95mResponse status code: ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

  Future<Map<String, String>> _setHeader() async {
    // var token = GetStorage().read(Constant.token);
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-api-key': 'reqres-free-v1'
      };

  }

  dynamic _processResponse(http.Response response) {
    log("Response Body->\n${response.body}");
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 202:
        return json.decode(response.body);
      case 204:
        return null;
      case 201:
        return json.decode(response.body);
      case 400:
        final decoded = json.decode(response.body);
        throw BadRequestException(decoded['message'] ?? 'Bad Request');
      case 403:
        final decoded = json.decode(response.body);
        throw UnAuthorizedException(
          decoded['message'] ?? 'Unauthorized',
        );
      case 404:
        final decoded = json.decode(response.body);
        throw NotFoundException(
          decoded['message'] ?? 'Not Found',
        );
      case 401:
        final decoded = json.decode(response.body);
        throw AuthException(
          decoded['message'] ?? 'Unauthorized',
        );
      case 408:
        final decoded = json.decode(response.body);
        throw ApiNotRespondingException(
          decoded['message'] ?? 'API not responding',
        );
      case 409:
        final decoded = json.decode(response.body);
        throw ConflictException(
          decoded['message'] ?? 'Conflict',
        );
      case 410:
        final decoded = json.decode(response.body);
        throw GoneException(
          decoded['message'] ?? 'Gone',
        );
      case 412:
        final decoded = json.decode(response.body);
        throw PreconditionFailedException(
          decoded['message'] ?? 'Precondition Failed',
        );
      case 415:
        final decoded = json.decode(response.body);
        throw UnsupportedMediaTypeException(
          decoded['message'] ?? 'Unsupported Media Type',
        );
      case 429:
        final decoded = json.decode(response.body);
        throw TooManyRequestsException(
          decoded['message'] ?? 'Too Many Requests',
        );
      case 422:
        final decoded = json.decode(response.body);
        throw UnProcessableEntityException(
          decoded['message'] ?? 'Unprocessable Entity',
        );
      case 500:
        final decoded = json.decode(response.body);
        throw ServerException(
          decoded['message'] ?? 'Internal Server Error',
        );
      case 502:
        final decoded = json.decode(response.body);
        throw BadGatewayException(
          decoded['message'] ?? 'Bad Gateway',
        );
      case 503:
        final decoded = json.decode(response.body);
        throw ServiceUnavailableException(
          decoded['message'] ?? 'Service Unavailable',
        );
      case 504:
        final decoded = json.decode(response.body);
        throw GatewayTimeoutException(
          decoded['message'] ?? 'Gateway Timeout',
        );
      default:
        final decoded = json.decode(response.body);
        throw FetchDataException(
          decoded['message'] ?? 'Error occurred',
        );
    }
  }

  Exception _handleException(dynamic error, String url) {
    if (error is SocketException) {
      return FetchDataException('No Internet connection');
    } else if (error is TimeoutException) {
      return ApiNotRespondingException('API not responded in time');
    } else {
      throw error;
    }
  }
}
