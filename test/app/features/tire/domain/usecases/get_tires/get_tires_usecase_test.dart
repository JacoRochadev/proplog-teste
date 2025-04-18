import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tires_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/get_tires_usecase.dart';

import '../../../../../core/shared/failure/mock.dart';
import '../../../mocks/tire_mocks.dart';

class MockRepository extends Mock implements IGetTiresRepository {}

void main() {
  final repository = MockRepository();
  final usecase = GetTiresUsecase(repository);

  test('get tires usecase ...', () async {
    when(() => repository.call(tiresParamMock))
        .thenAnswer((invocation) async => const Right([tiresEntityMock]));
    final result = await usecase.call(tiresParamMock);
    expect(result.fold(id, id), isA<List<TireEntity>>());
  });

  test('get tires usecase Failure ...', () async {
    when(() => repository.call(tiresParamMock))
        .thenAnswer((invocation) async => Left(RootExceptionMock()));
    final result = await usecase.call(tiresParamMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
