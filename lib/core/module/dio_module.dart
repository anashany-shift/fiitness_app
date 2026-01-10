import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constant.dart';
import '../helper/token_storage.dart';

@module
abstract class DioModule {
  @singleton
  @Named('mainApi')
  Dio provideMainDio() {
    final dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

    _addInterceptors(dio);
    return dio;
  }

  @singleton
  @Named('secondaryApi')
  Dio provideThemealdb() {
    final dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl2));

    _addInterceptors(dio);
    return dio;
  }

  void _addInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        filter: (options, args) {
          if (options.path.contains('/posts')) return false;
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }
}
