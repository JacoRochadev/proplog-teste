import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';

abstract class IGetTiresDatasource {
  Future<List<TireEntity>> call(GetTiresParams params);
}
