import '../../data/models/currency.dart';
import '../../data/models/currency_historical.dart';

abstract class CurrencyStates {}



class CurrencyStatesInitial extends CurrencyStates {}

class GetAllCurrencyLoading extends CurrencyStates {}

class GetAllCurrencyError extends CurrencyStates {
  final String error;

  GetAllCurrencyError({
    required this.error,
  });
}

class GetAllCurrencySuccess extends CurrencyStates {
  final List<Datum> data;

  GetAllCurrencySuccess({
    required this.data,
  });
}


//----------------------------------
class GetAllCurrencyHistoricalLoading extends CurrencyStates {}

class GetAllCurrencyHistoricalError extends CurrencyStates {
  final String error;

  GetAllCurrencyHistoricalError({
    required this.error,
  });
}

class GetAllCurrencyHistoricalSuccess extends CurrencyStates {
  final List<DatumHistorical> data;

  GetAllCurrencyHistoricalSuccess({
    required this.data,
  });
}



