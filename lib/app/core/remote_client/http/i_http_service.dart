import 'package:prolog_teste/app/core/remote_client/http/helpers/params.dart';
import 'package:prolog_teste/app/core/remote_client/http/helpers/responses.dart';

abstract class IHttpService {
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param);
}
