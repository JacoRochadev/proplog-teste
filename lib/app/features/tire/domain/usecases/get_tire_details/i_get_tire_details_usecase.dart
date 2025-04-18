import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';

abstract class IGetTireDetailsUsecase {
  Future<Either<IAppException, TireDetailsEntity>> call(
    GetTireDetailsParams params,
  );
}
