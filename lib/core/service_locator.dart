import 'package:get_it/get_it.dart';
import 'package:task01/core/sqf_db.dart';

import '../data/implementation/currency.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<SqfDB>(SqfDB());
  getIt.registerSingleton<CurrencyImplementation>(
    CurrencyImplementation(
      apiService: getIt.get<ApiService>(),
      sqfDB: getIt.get<SqfDB>(),
    ),
  );
}
