import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task01/core/sqf_db.dart';

import 'core/service_locator.dart';
import 'data/implementation/currency.dart';
import 'presentation/bloc/currency_cubit.dart';
import 'presentation/screens/currencies_last.dart';
import 'presentation/screens/home.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyCubit(
        currencyRepository: getIt.get<CurrencyImplementation>(),
        sqfDB: getIt.get<SqfDB>(),
      )
        ..getAllCurrency(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency API',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.deepPurple,
            elevation: 4,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (context) => const HomePage(),
          CurrenciesLastSevenDay.route: (context) =>
              const CurrenciesLastSevenDay(),
        },
      ),
    );
  }
}
