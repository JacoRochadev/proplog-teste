import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tire_details_repository.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tire_details_datasource.dart';

class GetTireDetailsRepository implements IGetTireDetailsRepository {
  final IGetTireDetailsDatasource _datasource;

  const GetTireDetailsRepository(this._datasource);

  @override
  Future<Either<IAppException, TireDetailsEntity>> call(
    GetTireDetailsParams params,
  ) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
