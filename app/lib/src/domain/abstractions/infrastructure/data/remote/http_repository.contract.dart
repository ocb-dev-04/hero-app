import 'package:dio/dio.dart';

/// Contract with generic
abstract class HttpRepositoryContract {
  /// Get [T] from http service
  Future<Response> get({
    String path = "",
    Map<String, dynamic> params = const {},
  });
}
