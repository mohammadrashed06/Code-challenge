import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency_cubit.dart';
import '../bloc/currency_states.dart';
import '../widget/all_currency_build.dart';
import '../widget/error_currency.dart';
import '../widget/lading_shimmer.dart';
import 'currencies_last.dart';

class HomePage extends StatelessWidget {
  static const String route = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency API",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CurrenciesLastSevenDay.route);
            },
            icon: const Icon(Icons.timelapse),
          ),
        ],
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyStates>(
        builder: (context, state) {
          if (state is GetAllCurrencyLoading) {
            log("Loading");
            return const LoadingShimmer();
          } else if (state is GetAllCurrencyError) {
            return ErrorInGetCurrency(error: state.error);
          } else if (state is GetAllCurrencySuccess) {
            log("List len = ${state.data.length}");
            return AllCurrencyBuild(data: state.data);
          } else {
            return const LoadingShimmer();
          }
        },
      ),
    );
  }
}
