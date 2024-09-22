import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout ');
      case DioExceptionType.sendTimeout:
        return ServerFailure('connection timeout ');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('connection timeout ');
      case DioExceptionType.badCertificate:
        return ServerFailure('connection timeout ');
      // todo
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel timeout ');
      case DioExceptionType.connectionError:
        return ServerFailure('connection timeout ');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('unexpected error , plz try later  ');

      default:
        return ServerFailure('oops there is an error ');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found  , please try again later ');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error  ,  please try again later ');
    } else {
      return ServerFailure('oops there is an error ');
    }
  }
}
