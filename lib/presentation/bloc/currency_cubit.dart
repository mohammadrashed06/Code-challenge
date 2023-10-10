import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/sqf_db.dart';
import '../../data/models/currency.dart';
import '../../data/models/currency_historical.dart';
import '../../data/repositories/currency.dart';
import 'currency_states.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  final CurrencyRepository currencyRepository;
  final SqfDB sqfDB;

  CurrencyCubit({
    required this.currencyRepository,
    required this.sqfDB,
  }) : super(CurrencyStatesInitial());

  void getAllCurrency() async {
    try {
      emit(GetAllCurrencyLoading());
      await currencyRepository.getAllCurrency();
      List<Datum> allCurrencies = await sqfDB.getAllCurrencies();
      emit(GetAllCurrencySuccess(data: allCurrencies));
    } catch (e) {
      emit(GetAllCurrencyError(error: e.toString()));
    }
  }

  void geCurrencyHistorical() async {
    try {
      log("Start get Historical");
      emit(GetAllCurrencyHistoricalLoading());
      CurrencyHistoricalModel currencyHistoricalModel =
          await currencyRepository.geCurrencyHistorical(
        baseCurrency: "BIF",
        currency1: "USD",
        currency2: "ALL",
      );
      emit(GetAllCurrencyHistoricalSuccess(
        data: currencyHistoricalModel.data.values.toList(),
      ));
    } catch (e) {
      emit(GetAllCurrencyHistoricalError(error: e.toString()));
    }
  }
}
