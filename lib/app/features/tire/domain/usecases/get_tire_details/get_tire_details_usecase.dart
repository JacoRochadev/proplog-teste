import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tire_details_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/i_get_tire_details_usecase.dart';

class GetTireDetailsUsecase implements IGetTireDetailsUsecase {
  final IGetTireDetailsRepository _repository;

  const GetTireDetailsUsecase(this._repository);
  
  @override
  Future<Either<IAppException, TireDetailsEntity>> call(
    GetTireDetailsParams params,
  ) async {
    return await _repository.call(params);
  }
}
