import 'package:dartz/dartz.dart';
import 'package:prolog_teste/app/core/errors/i_app_exception.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tires_repository.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tires_datasource.dart';

class GetTiresRepository implements IGetTiresRepository {
  final IGetTiresDatasource _datasource;

  const GetTiresRepository(this._datasource);

  @override
  Future<Either<IAppException, List<TireEntity>>> call(
      GetTiresParams params) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
