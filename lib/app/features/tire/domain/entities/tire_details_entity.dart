import 'package:prolog_teste/app/features/tire/domain/enums/status_tire_enum.dart';

class TireDetailsEntity {
  final String serialNumber;
  final String make;
  final String companyGroupName;
  final String branchOfficeName;
  final StatusTireEnum? status;
  final int id, timesRetreaded, maxRetreadsExpected;
  final num purchaseCost;
  final num tireSizeHeight;
  final num recommendedPressure;
  final num tireSizeWidth;
  final num currentPressure;
  final bool newTire;

  const TireDetailsEntity({
    required this.id,
    required this.serialNumber,
    required this.tireSizeHeight,
    required this.tireSizeWidth,
    required this.timesRetreaded,
    required this.maxRetreadsExpected,
    required this.recommendedPressure,
    required this.currentPressure,
    required this.purchaseCost,
    required this.newTire,
    required this.make,
    required this.companyGroupName,
    required this.branchOfficeName,
    required this.status,
  });
}
