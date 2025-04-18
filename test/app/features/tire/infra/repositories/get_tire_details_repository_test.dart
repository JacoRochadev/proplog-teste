import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tire_details_datasource.dart';
import 'package:prolog_teste/app/features/tire/infra/repositories/get_tire_details_repository.dart';

import '../../../../core/shared/failure/mock.dart';
import '../../mocks/tire_mocks.dart';

class MockDatasource extends Mock implements IGetTireDetailsDatasource {}

void main() {
  final datasource = MockDatasource();
  final repository = GetTireDetailsRepository(datasource);
  test('get tire repository ...', () async {
    when(() => datasource.call(tireDetailsParamMock))
        .thenAnswer((invocation) async => tireDetailsEntityMock);
    final result = await repository.call(tireDetailsParamMock);
    expect(result.fold((l) => l, (r) => r), isA<TireDetailsEntity>());
  });
  test('get tireDetails repository Failure...', () async {
    when(() => datasource.call(tireDetailsParamMock))
        .thenThrow(RootExceptionMock());
    final result = await repository.call(tireDetailsParamMock);
    expect(result.fold((l) => l, (r) => r), isA<Exception>());
  });
}
