import '../errors/i_app_exception.dart';

class HttpServiceException extends IAppException {
  final int? statusCode;

  const HttpServiceException({
    this.statusCode,
    required super.message,
    required super.stackTrace,
  });
}
