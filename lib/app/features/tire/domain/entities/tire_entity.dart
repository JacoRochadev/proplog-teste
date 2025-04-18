class TireEntity {
  final int id;
  final String serialNumber;
  final String make;
  final String companyGroupName;
  final num purchaseCost;

  const TireEntity({
    required this.id,
    required this.serialNumber,
    required this.make,
    required this.purchaseCost,
    required this.companyGroupName,
  });
}
