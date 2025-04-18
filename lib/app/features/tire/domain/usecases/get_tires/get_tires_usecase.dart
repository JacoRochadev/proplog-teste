import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tires_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/i_get_tires_usecase.dart';

class GetTiresUsecase implements IGetTiresUsecase {
  final IGetTiresRepository _repository;

  const GetTiresUsecase(this._repository);
  
  @override
  Future<Either<IAppException, List<TireEntity>>> call(
    GetTiresParams params,
  ) async {
    return await _repository.call(params);
  }
}
