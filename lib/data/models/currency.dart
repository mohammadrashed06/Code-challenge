class CurrencyModel {
  final Map<String, Datum> data;

  const CurrencyModel({
    required this.data,
  });
}

class Datum {
  final String? symbol;
  final String? name;
  final String? symbolNative;
  final int decimalDigits;
  final int rounding;
  final String? code;
  final String? namePlural;
  final String imageUrl;

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "name": name,
      "symbol_native": symbolNative,
      "decimal_digits": decimalDigits,
      "rounding": rounding,
      "code": code,
      "name_plural": namePlural,
      "imageUrl": imageUrl,
    };
  }

  const Datum({
    required this.symbol,
    required this.name,
    required this.symbolNative,
    required this.decimalDigits,
    required this.rounding,
    required this.code,
    required this.namePlural,
    required this.imageUrl,
  });

  factory Datum.fromJson(
    Map<String, dynamic> json,
  ) {
    return Datum(
      symbol: json["symbol"],
      name: json["name"],
      symbolNative: json["symbol_native"],
      decimalDigits: int.parse(json["decimal_digits"].toString()),
      rounding: int.parse(json["rounding"].toString()),
      code: json["code"],
      namePlural: json["name_plural"],
      imageUrl:
          "https://flagcdn.com/16x12/${json["name"].toString().substring(0, 2).toLowerCase()}.png",
    );
  }
}
