class CareData {
  const CareData({
    this.light,
    this.atmosphericHumidity,
    this.soilNutrients,
    this.soilSalinity,
    this.soilHumidity,
    this.bloomMonths = const [],
  });

  final double? light;
  final double? atmosphericHumidity;
  final double? soilNutrients;
  final double? soilSalinity;
  final double? soilHumidity;
  final List<String> bloomMonths;

  factory CareData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CareData();
    }
    return CareData(
      light: _number(json['light']),
      atmosphericHumidity: _number(json['atmospheric_humidity']),
      soilNutrients: _number(json['soil_nutrients']),
      soilSalinity: _number(json['soil_salinity']),
      soilHumidity: _number(json['soil_humidity']),
      bloomMonths: _stringList(json['bloom_months']),
    );
  }

  bool get hasValues {
    return light != null ||
        atmosphericHumidity != null ||
        soilNutrients != null ||
        soilSalinity != null ||
        soilHumidity != null ||
        bloomMonths.isNotEmpty;
  }

  static double? _number(dynamic value) {
    if (value is num && value is! bool) {
      return value.toDouble();
    }
    return null;
  }

  static List<String> _stringList(dynamic value) {
    if (value is! List) {
      return const [];
    }
    return value.whereType<String>().toList();
  }
}
