import 'package:app/src/utils/dio_settings.dart';
import 'package:app/src/domain/exceptions/http_exceptions.dart';
import 'package:app/src/domain/abstractions/infrastructure/data/remote/http_repository.contract.dart';
import 'package:dio/dio.dart';

/// [HttpRepositoryContract] implementation
class HttpRepository implements HttpRepositoryContract {
  HttpRepository._();

  static final instance = HttpRepository._();

  @override
  Future<Response> get({
    String path = "",
    Map<String, dynamic> params = const {},
  }) async {
    final data = await DioSettings.dio().get(path, queryParameters: params);
    if (data.statusCode! > 204) {
      _manageErrorsStatusCode(data.statusCode!, data.data);
    }

    return data;
  }

  void _manageErrorsStatusCode(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 403:
        throw ForbiddenException();
      case 404:
        throw NotFoundException();
      case 500:
        throw InternalServerErrorException();
      default:
        throw HttpRequestException();
    }
  }
}
