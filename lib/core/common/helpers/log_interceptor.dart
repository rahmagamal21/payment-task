import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LogInterceptor {
  static void setup() {
    final logger = Logger('Dio');
    Dio().interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            logger.info('REQUEST[${options.method}] => PATH: ${options.path}');
            return handler.next(options);
          },
          onResponse: (response, handler) {
            logger.info(
                'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
            return handler.next(response);
          },
          onError: (DioException e, handler) {
            logger.severe(
                'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
                e);
            return handler.next(e);
          },
        ));
  }
}
