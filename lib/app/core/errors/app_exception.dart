import 'package:flutter/material.dart';

import 'i_app_exception.dart';

@immutable
class AppException extends IAppException {
  const AppException({
    required super.message,
    required super.stackTrace,
  });
}
