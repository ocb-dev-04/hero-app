import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

import 'package:app/src/utils/logger.dart';
import 'package:app/src/utils/env_config.dart';
import 'package:app/src/utils/constants/http.dart';

class DioSettings {
  static Dio dio({String baseUrl = KHttpConstants.baseApiUrl}) {
    Dio dio = Dio();

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 1000 * 10);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final pubKey = EnvConfig.publicKey;
          final ts = DateTime.now().millisecondsSinceEpoch;
          final hash = _createHash(pubKey, ts);

          options.queryParameters.addAll({
            'apikey': pubKey,
            'hash': hash,
            'ts': ts,
          });

          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          handler.resolve(error.response!);
        },
      ),
    );

    return dio;
  }

  static String _createHash(String pubKey, int ts) {
    final privKey = EnvConfig.privateKey;

    final bytesToHash = utf8.encode('$ts$privKey$pubKey');
    final hash = md5.convert(bytesToHash);
    return hash.toString();
  }
}
