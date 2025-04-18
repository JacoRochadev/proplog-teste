import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:prolog_teste/app/core/failures/http_service_exception.dart';
import 'package:prolog_teste/app/core/remote_client/http/helpers/params.dart';
import 'package:prolog_teste/app/core/remote_client/http/helpers/responses.dart';
import 'package:prolog_teste/app/core/remote_client/http/i_http_service.dart';
import 'package:prolog_teste/app/core/remote_client/http/providers/i_headers_provider.dart';

class HttpService implements IHttpService {
  final IHeadersProvider _headersProvider;

  const HttpService(this._headersProvider);

  @override
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param) async {
    try {
      final mergedHeaders = {
        ..._headersProvider.headers,
        ...?param.headers,
      };

      final httpResponse = await http.get(
        Uri.parse(param.url).replace(queryParameters: param.data),
        headers: mergedHeaders,
      );

      T? data;

      if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
        if (param.responseType == HttpResponseType.json) {
          data = jsonDecode(httpResponse.body) as T;
        } else if (param.responseType == HttpResponseType.bytes) {
          data = httpResponse.bodyBytes as T;
        } else {
          data = httpResponse.body as T;
        }
        return GetHttpServiceResponse<T>(data: data);
      } else {
        throw HttpServiceException(
          message: httpResponse.body,
          statusCode: httpResponse.statusCode,
          stackTrace: StackTrace.current,
        );
      }
    } on HttpException catch (e, s) {
      throw HttpServiceException(
        message: e.message,
        statusCode: 500,
        stackTrace: s,
      );
    }
  }
}