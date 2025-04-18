import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';

abstract class IGetTireDetailsDatasource {
  Future<TireDetailsEntity> call(GetTireDetailsParams params);
}
