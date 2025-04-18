import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/enums/status_tire_enum.dart';

class TireDetailsMapper {
  static TireDetailsEntity fromMap(Map<dynamic, dynamic> map) {
    final makeMap = map['make'] as Map<String, dynamic>?;

    return TireDetailsEntity(
      id: map['id'],
      serialNumber: map['serialNumber'],
      tireSizeHeight: map['tireSize']['height'],
      tireSizeWidth: map['tireSize']['width'],
      timesRetreaded: map['timesRetreaded'],
      maxRetreadsExpected: map['maxRetreadsExpected'],
      recommendedPressure: map['recommendedPressure'],
      currentPressure: map['currentPressure'],
      purchaseCost: map['purchaseCost'],
      newTire: map['newTire'],
      make: makeMap != null ? makeMap['name'] as String : '',
      companyGroupName: map['companyGroupName'],
      branchOfficeName: map['branchOfficeName'],
      status: StatusTireEnum.fromPortuguese(map['status']),
    );
  }
}
