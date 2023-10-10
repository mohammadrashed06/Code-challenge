import 'package:flutter_test/flutter_test.dart';
import 'package:task01/core/api_service.dart';
import 'package:task01/core/sqf_db.dart';
import 'package:task01/data/implementation/currency.dart';
import 'package:task01/data/models/currency.dart';
import 'package:task01/data/models/currency_historical.dart';
import 'package:task01/data/repositories/currency.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  CurrencyRepository? currencyRepo;
  setUp(
    () {
      currencyRepo = CurrencyImplementation(
        apiService: ApiService(),
        sqfDB: SqfDB(),
      );
    },
  );

  group("Test Case For All API", () {

    test("Get All Currency ...", () async {
      final CurrencyModel currencyModel = await currencyRepo!.getAllCurrency();
      expect(currencyModel, isA<CurrencyModel>());
    });

    test("Get Currency Historical last 7 days...", () async {
      final CurrencyHistoricalModel currencyHistoricalModel =
          await currencyRepo!.geCurrencyHistorical(
        baseCurrency: "BIF",
        currency1: "USD",
        currency2: "ALL",
      );
      expect(currencyHistoricalModel, isA<CurrencyHistoricalModel>());
    });
  });
}
