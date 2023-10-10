import '../models/currency.dart';
import '../models/currency_historical.dart';

mixin CurrencyRepository {
  Future<CurrencyModel> getAllCurrency();

  Future<CurrencyHistoricalModel> geCurrencyHistorical({
    required String baseCurrency,
    required String currency1,
    required String currency2,
  });
}
