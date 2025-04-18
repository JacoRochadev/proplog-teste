import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';

abstract class IGetTiresUsecase {
  Future<Either<IAppException, List<TireEntity>>> call(
    GetTiresParams params,
  );
}
