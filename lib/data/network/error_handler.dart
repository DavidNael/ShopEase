import 'package:dio/dio.dart';
import 'package:shopease/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure =
          Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataErrorSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataErrorSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataErrorSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        return DataErrorSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataErrorSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataErrorSource.unknownError.getFailure();
    default:
      return DataErrorSource.defaultError.getFailure();
  }
}

enum DataErrorSource {
  success,
  noContent,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalServerError,
  serviceUnavailable,
  noInternetConnection,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  defaultError,
  unknownError,
}

extension DataSourceExtension on DataErrorSource {
  Failure getFailure() {
    switch (this) {
      case DataErrorSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataErrorSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataErrorSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataErrorSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataErrorSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataErrorSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataErrorSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataErrorSource.serviceUnavailable:
        return Failure(ResponseCode.serviceUnavailable,
            ResponseMessage.serviceUnavailable);
      case DataErrorSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataErrorSource.connectionTimeout:
        return Failure(
            ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case DataErrorSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataErrorSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataErrorSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataErrorSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataErrorSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
      case DataErrorSource.unknownError:
        return Failure(ResponseCode.unknownError, ResponseMessage.unknownError);
      default:
        return Failure(ResponseCode.unknownError, ResponseMessage.unknownError);
    }
  }
}

class ResponseCode {
  //server error codes
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;

  //local error codes
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
  static const int unknownError = -8;
}

class ResponseMessage {
  static const String success = 'Success';
  static const String noContent = 'No Content';
  static const String badRequest = 'Bad Request, Please try again.';
  static const String unauthorized = 'User is not authorized, try again later.';
  static const String forbidden = 'Forbidden Access Denied';
  static const String notFound = 'Not Found';
  static const String internalServerError =
      'Something went wrong, please try again later.';
  static const String serviceUnavailable = 'Service Unavailable';
  static const String connectionTimeout =
      'Connection Timeout, Please try again.';
  static const String cancel = 'Request was Cancelled';
  static const String receiveTimeout = 'Connection Timeout, Please try again.';
  static const String sendTimeout = 'Connection Timeout, Please try again.';
  static const String cacheError = 'Cache Error';
  static const String noInternetConnection =
      'No Internet Connection, check your connection and try again.';
  static const String defaultError =
      'Something went wrong, please try again later.';
  static const String unknownError =
      'Something went wrong, please try again later.';
}

class ApiInternalStatus {
  static const int success = 0;
  static const int error = 1;
}
