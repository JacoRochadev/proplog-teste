import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';

class RootExceptionMock extends Mock implements IAppException {
  @override
  String get message => '';
}
