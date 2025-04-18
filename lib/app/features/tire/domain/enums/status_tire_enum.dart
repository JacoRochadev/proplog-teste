enum StatusTireEnum {
  inventory('INVENTORY'),
  analysis('ANALYSIS'),
  installed('INSTALLED'),
  disposal('DISPOSAL');

  const StatusTireEnum(this.value);
  final String value;

  String get name => switch (this) {
        StatusTireEnum.inventory => 'Inventário',
        StatusTireEnum.analysis => 'Análise',
        StatusTireEnum.installed => 'Instalado',
        StatusTireEnum.disposal => 'Disponível',
      };

  static StatusTireEnum? fromPortuguese(String? value) => switch (value) {
        'INVENTORY' => StatusTireEnum.inventory,
        'ANALYSIS' => StatusTireEnum.analysis,
        'INSTALLED' => StatusTireEnum.installed,
        'DISPOSAL' => StatusTireEnum.disposal,
        _ => null,
      };
}