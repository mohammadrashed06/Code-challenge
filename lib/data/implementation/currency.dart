import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:task01/data/models/currency.dart';
import 'package:task01/data/models/currency_historical.dart';

import '../../core/api_service.dart';
import '../../core/sqf_db.dart';
import '../repositories/currency.dart';

class CurrencyImplementation implements CurrencyRepository {
  final ApiService _apiService;
  final SqfDB sqfDB;

  const CurrencyImplementation({
    required ApiService apiService,
    required this.sqfDB,
  }) : _apiService = apiService;

  @override
  Future<CurrencyModel> getAllCurrency() async {
    try {
      final Map<String, dynamic> data = await _apiService.getResponse(
        endPoint: "currencies",
        queryParameter: "currencies=",
      );
      final Map<String, Datum> currencyData = Map.fromEntries(
        data.entries.map(
          (entry) => MapEntry(
            entry.key,
            Datum.fromJson(
              Map<String, dynamic>.from(entry.value),
            ),
          ),
        ),
      );
      CurrencyModel currencyModel = CurrencyModel(data: currencyData);
      for (final currency in currencyModel.data.values) {
        await sqfDB.insertCurrency(currency);
      }
      return currencyModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CurrencyHistoricalModel> geCurrencyHistorical({
    required String baseCurrency,
    required String currency1,
    required String currency2,
  }) async {
    try {
      DateTime dateTime = DateTime.now().subtract(const Duration(days: 7));
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

      //https://api.currencyapi.com/v3/historical?apikey=cur_live_iqkx3JAPtG2Ql5OCEwXr1mx6ZKHjh4Ze7eTk47Ej&currencies=USD%2CALL&base_currency=BIF&date=2023-10-09
      final Map<String, dynamic> dataInAPI = await _apiService.getResponse(
        endPoint: "historical",
        queryParameter: "currencies=$currency1%2C$currency2&base_currency=$baseCurrency&date=$formattedDate",
      );
      log("API Data = ${dataInAPI.values}");
      final data = Map<String, DatumHistorical>.from(
        dataInAPI.map(
          (key, value) => MapEntry(
            key,
            DatumHistorical.fromJson(value),
          ),
        ),
      );
      return CurrencyHistoricalModel(data: data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
