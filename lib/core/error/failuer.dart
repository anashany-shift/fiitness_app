import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassage;

  Failure(this.errorMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMassage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with Api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponseError(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('request cancel with server');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet');
      case DioExceptionType.unknown:
        return ServerFailure('oops there was an error ,please try again');
    }
  }

factory ServerFailure.fromResponseError(int statusCode, dynamic response) {
  try {
    // If response is a raw string (sometimes Dio returns plain string)
    if (response is String) {
      // try to return the string itself
      return ServerFailure(response);
    }

    // If response is a Map
    if (response is Map<String, dynamic>) {
      // 1) top-level "message"
      if (response['message'] is String && (response['message'] as String).isNotEmpty) {
        return ServerFailure(response['message']);
      }

      // 2) top-level "error" as String
      if (response['error'] is String && (response['error'] as String).isNotEmpty) {
        return ServerFailure(response['error']);
      }

      // 3) top-level "error" as Map with "message"
      if (response['error'] is Map && response['error']['message'] is String) {
        return ServerFailure(response['error']['message']);
      }

      // 4) "errors" map (take first string)
      if (response['errors'] is Map) {
        final firstError = (response['errors'] as Map).values.first;
        if (firstError is String) {
          return ServerFailure(firstError);
        }
        // sometimes errors contain list
        if (firstError is List && firstError.isNotEmpty && firstError.first is String) {
          return ServerFailure(firstError.first);
        }
      }

      // 5) sometimes API returns { "data": { "message": "..." } }
      if (response['data'] is Map && response['data']['message'] is String) {
        return ServerFailure(response['data']['message']);
      }
    }

    // Status code based fallback (safely)
    if (statusCode == 400 || statusCode == 401 || statusCode == 402 || statusCode == 403) {
      // Try to extract any usable message rather than assuming structure
      if (response is Map) {
        final maybeMsg = response['error'] ??
            response['message'] ??
            (response['errors'] is Map ? (response['errors'] as Map).values.first : null);
        if (maybeMsg is String) return ServerFailure(maybeMsg);
        if (maybeMsg is List && maybeMsg.isNotEmpty && maybeMsg.first is String) {
          return ServerFailure(maybeMsg.first);
        }
      }
      return ServerFailure('Bad request, please check your input.');
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try again.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error');
    }

    return ServerFailure('Oops! Something went wrong. Please try again.');
  } catch (e) {
    // guard fallback
    return ServerFailure('Unexpected error format from server');
  }
}

}
