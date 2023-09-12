import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dw_barbershop/src/core/restClient/interceptors/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          baseUrl: 'http://192.168.1.88:8080',
          //baseUrl: 'http://2804:d41:c624:2500:5c41:d59e:79f4:1496:8080',
          //baseUrl: 'http://localhost:8080',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
      PrettyDioLogger(),
    ]);
  }

  RestClient get auth => this..options.extra['DIO_AUTH_KEY'] = true;
  RestClient get unAuth => this..options.extra['DIO_AUTH_KEY'] = false;
}
