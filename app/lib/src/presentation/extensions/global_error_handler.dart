import 'package:app/src/utils/logger.dart';

class GlobalErrorHandler {
  static void handleError(Object e, {String fileName = ''}) {
    // TODO: can handle errors using alerts, notifications etc...
    DebugLogger.show(e.toString(), fileName: fileName);
  }
}
