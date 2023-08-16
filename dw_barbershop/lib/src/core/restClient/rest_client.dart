import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          //baseUrl: 'http://192.168.1.88:8080', se não funcionar usar o ip4
          //baseUrl: 'http://2804:d41:c624:2500:5c41:d59e:79f4:1496:8080',
          baseUrl: 'http://localhost:8080', 
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
