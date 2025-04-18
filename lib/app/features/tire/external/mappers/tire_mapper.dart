import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';

class TireMapper {
  static TireEntity fromMap(Map<dynamic, dynamic> map) {
    final makeMap = map['make'] as Map<String, dynamic>?;
    return TireEntity(
      id: map['id'],
      serialNumber: map['serialNumber'],
      make: makeMap != null ? makeMap['name'] as String : '',
      purchaseCost: map['purchaseCost'],
      companyGroupName: map['companyGroupName'],
    );
  }

  static Map<String, dynamic> toMap(GetTiresParams params) {
    return {
      "branchOfficesId": [params.branchOfficesId.toString()],
      "pageSize": [params.pageSize.toString()],
      "pageNumber": [params.pageNumber.toString()],
    };
  }
}
