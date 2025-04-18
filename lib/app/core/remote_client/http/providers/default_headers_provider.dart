import 'i_headers_provider.dart';

class DefaultHeadersProvider implements IHeadersProvider {
  final String token;

  DefaultHeadersProvider({required this.token});

  @override
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'x-prolog-api-token': token,
      };
}
