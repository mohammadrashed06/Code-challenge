class CurrencyHistoricalModel {
  final Map<String, DatumHistorical> data;
  const CurrencyHistoricalModel({
    required this.data,
  });
}

class DatumHistorical {
  final String code;
  final double value;

  factory DatumHistorical.fromJson(Map<String, dynamic> json) {
    return DatumHistorical(
      code: json["code"],
      value: double.parse(json["value"].toString()),
    );
  }

  const DatumHistorical({
    required this.code,
    required this.value,
  });
}

/*class Meta {
  final DateTime lastUpdatedAt;

  const Meta({
    required this.lastUpdatedAt,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
    );
  }
}*/
