import 'package:flutter_modular/flutter_modular.dart';
import 'package:prolog_teste/app/core/remote_client/http/http_service.dart';
import 'package:prolog_teste/app/core/remote_client/http/i_http_service.dart';
import 'package:prolog_teste/app/core/remote_client/http/providers/default_headers_provider.dart';
import 'package:prolog_teste/app/core/remote_client/http/providers/i_headers_provider.dart';
import 'package:prolog_teste/app/parameters.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<IHeadersProvider>(() => DefaultHeadersProvider(token: key));
    i.add<IHttpService>(
      () => HttpService(i.get<IHeadersProvider>()),
    );
  }
}
