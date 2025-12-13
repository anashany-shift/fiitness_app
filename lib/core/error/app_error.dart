import 'package:dio/dio.dart';
class AppError {
  final String message;
  final int? statusCode;

  AppError({
    required this.message,
    this.statusCode,
  });
}


class ErrorHandler {
  static AppError handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    // Any other unexpected error
    return AppError(message: error.toString());
  }

  static AppError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return AppError(message: 'Connection timeout. Please try again.');

      case DioExceptionType.sendTimeout:
        return AppError(message: 'Send timeout. Please try again.');

      case DioExceptionType.receiveTimeout:
        return AppError(message: 'Server took too long to respond.');

      case DioExceptionType.cancel:
        return AppError(message: 'Request was cancelled.');

      case DioExceptionType.badCertificate:
        return AppError(message: 'Bad certificate. Check device time/date.');

      case DioExceptionType.connectionError:
        return AppError(message: 'No internet connection.');

      case DioExceptionType.badResponse:
        return _extractServerError(error.response);

      case DioExceptionType.unknown:
      default:
        return AppError(message: 'Unexpected error: ${error.message}');
    }
  }

  static AppError _extractServerError(Response? response) {
    if (response == null) {
      return AppError(message: 'No response from server.');
    }

    // Status Code
    final statusCode = response.statusCode;

    // HTML error (like 502 Bad Gateway)
    if (response.data is String && response.data.toString().startsWith('<html>')) {
      return AppError(
        message: 'Server error ($statusCode). Please try again later.',
        statusCode: statusCode,
      );
    }

    // JSON error body
    try {
      final data = response.data;

      if (data is Map) {
        if (data.containsKey('message')) {
          return AppError(message: data['message'], statusCode: statusCode);
        }
        if (data.containsKey('error')) {
          return AppError(message: data['error'], statusCode: statusCode);
        }
        if (data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is Map && errors.isNotEmpty) {
            final first = errors.values.first;
            if (first is List && first.isNotEmpty) {
              return AppError(message: first.first, statusCode: statusCode);
            }
          }
        }
      }

      if (data is String) {
        return AppError(message: data, statusCode: statusCode);
      }

      return AppError(
        message: 'Unexpected server response.',
        statusCode: statusCode,
      );
    } catch (e) {
      return AppError(
        message: 'Failed to parse server error.',
        statusCode: statusCode,
      );
    }
  }
}
