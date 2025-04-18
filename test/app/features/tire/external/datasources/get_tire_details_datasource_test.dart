import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/core/remote_client/http/helpers/params.dart';
import 'package:prolog_teste/app/core/remote_client/http/helpers/responses.dart';
import 'package:prolog_teste/app/core/remote_client/http/i_http_service.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/external/datasources/get_tire_details_datasource.dart';

import '../../mocks/tire_mocks.dart';

class IHttpServiceMock extends Mock implements IHttpService {}

class GetHttpServiceParamMock extends Fake implements GetHttpServiceParam {}

void main() {
  final hasuraClient = IHttpServiceMock();
  final datasource = GetTireDetailsDatasource(iHttpService: hasuraClient);

  setUpAll(() {
    registerFallbackValue(GetHttpServiceParamMock());
  });

  test('get tire details datasource ...', () async {
    when(() => hasuraClient.get(any()))
        .thenAnswer((invocation) async => GetHttpServiceResponse(
              data: getTireDetailsResponse,
            ));
    final result = await datasource.call(tireDetailsParamMock);
    expect(result, isA<TireDetailsEntity>());
  });
}