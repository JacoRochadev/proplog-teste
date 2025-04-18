import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tires_datasource.dart';
import 'package:prolog_teste/app/features/tire/infra/repositories/get_tires_repository.dart';

import '../../../../core/shared/failure/mock.dart';
import '../../mocks/tire_mocks.dart';

class MockDatasource extends Mock implements IGetTiresDatasource {}

void main() {
  final datasource = MockDatasource();
  final repository = GetTiresRepository(datasource);
  test('get tires repository ...', () async {
    when(() => datasource.call(tiresParamMock))
        .thenAnswer((invocation) async => [tiresEntityMock]);
    final result = await repository.call(tiresParamMock);
    expect(result.fold((l) => l, (r) => r), isA<List<TireEntity>>());
  });
  test('get tires repository Failure...', () async {
    when(() => datasource.call(tiresParamMock)).thenThrow(RootExceptionMock());
    final result = await repository.call(tiresParamMock);
    expect(result.fold((l) => l, (r) => r), isA<Exception>());
  });
}
