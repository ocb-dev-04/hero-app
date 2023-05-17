abstract class HttpException implements Exception {
  String getTranslationKey();
}

class HttpRequestException extends HttpException {
  @override
  String getTranslationKey() => "httpRequestException";
}

class BadRequestException extends HttpException {
  @override
  String getTranslationKey() => "httpBadRequest";
}

class UnauthorizedException extends HttpException {
  @override
  String getTranslationKey() => "httpUnauthorized";
}

class ForbiddenException extends HttpException {
  @override
  String getTranslationKey() => "httpForbidden";
}

class NotFoundException extends HttpException {
  @override
  String getTranslationKey() => "httpNotFound";
}

class InternalServerErrorException extends HttpException {
  @override
  String getTranslationKey() => "httpInternalServerError";
}
