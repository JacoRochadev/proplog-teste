import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/i_get_tire_details_usecase.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/i_get_tires_usecase.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_store.dart';
import 'package:triple_test/triple_test.dart';

import '../../../../core/shared/failure/mock.dart';
import '../../mocks/tire_mocks.dart';

class IGetTiresUsecaseMock extends Mock implements IGetTiresUsecase {}

class IGetTireDetailsUsecaseMock extends Mock
    implements IGetTireDetailsUsecase {}

class GetTiresParamsFake extends Fake implements GetTiresParams {}

class GetTireDetailsParamsFake extends Fake implements GetTireDetailsParams {}

void main() {
  late TireStore store;
  late IGetTiresUsecase iGetTiresUsecase;
  late IGetTireDetailsUsecase iGetTireDetailsUsecase;

  setUp(() {
    iGetTiresUsecase = IGetTiresUsecaseMock();
    iGetTireDetailsUsecase = IGetTireDetailsUsecaseMock();

    registerFallbackValue(GetTiresParamsFake());
    registerFallbackValue(GetTireDetailsParamsFake());

    store = TireStore(
      iGetTiresUsecase: iGetTiresUsecase,
      iGetTireDetailsUsecase: iGetTireDetailsUsecase,
    );
  });
  storeTest(
    'getTires success',
    build: () {
      when(() => iGetTiresUsecase.call(any()))
          .thenAnswer((invocation) async => const Right([tiresEntityMock]));
      return store;
    },
    act: (store) => store.getTires(tiresParamMock),
    expect: () => [tripleLoading, tripleState],
  );

  storeTest(
    'getTires failure',
    build: () {
      when(() => iGetTiresUsecase.call(any()))
          .thenAnswer((invocation) async => Left(RootExceptionMock()));
      return store;
    },
    act: (store) => store.getTires(tiresParamMock),
    expect: () => [tripleLoading, tripleError],
  );

  storeTest(
    'getTireDetails success',
    build: () {
      when(() => iGetTireDetailsUsecase.call(any()))
          .thenAnswer((invocation) async => const Right(tireDetailsEntityMock));
      return store;
    },
    act: (store) => store.getTireDetails(tireDetailsParamMock),
    expect: () => [tripleLoading, tripleState],
  );

  storeTest(
    'getTireDetails failure',
    build: () {
      when(() => iGetTireDetailsUsecase.call(any()))
          .thenAnswer((invocation) async => Left(RootExceptionMock()));
      return store;
    },
    act: (store) => store.getTireDetails(tireDetailsParamMock),
    expect: () => [tripleLoading, tripleError],
  );
}
