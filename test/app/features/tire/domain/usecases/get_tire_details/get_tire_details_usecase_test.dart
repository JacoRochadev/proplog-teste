import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tire_details_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/get_tire_details_usecase.dart';

import '../../../../../core/shared/failure/mock.dart';
import '../../../mocks/tire_mocks.dart';

class MockRepository extends Mock implements IGetTireDetailsRepository {}

void main() {
  final repository = MockRepository();
  final usecase = GetTireDetailsUsecase(repository);

  test('get tire details usecase ...', () async {
    when(() => repository.call(tireDetailsParamMock))
        .thenAnswer((invocation) async => const Right(tireDetailsEntityMock));
    final result = await usecase.call(tireDetailsParamMock);
    expect(result.fold(id, id), isA<TireDetailsEntity>());
  });

  test('get tire details usecase Failure ...', () async {
    when(() => repository.call(tireDetailsParamMock))
        .thenAnswer((invocation) async => Left(RootExceptionMock()));
    final result = await usecase.call(tireDetailsParamMock);
    expect(result.fold(id, id), isA<Exception>());
  });
}
