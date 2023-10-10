import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency_cubit.dart';
import '../bloc/currency_states.dart';
import '../widget/error_currency.dart';
import '../widget/historical_currency_build.dart';
import '../widget/lading_shimmer.dart';

class CurrenciesLastSevenDay extends StatelessWidget {
  static const String route =  "currencies_last_seven_day";
  const CurrenciesLastSevenDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        BlocProvider.of<CurrencyCubit>(context).getAllCurrency();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Currency Last 7 Days",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<CurrencyCubit, CurrencyStates>(
          builder: (context, state) {
            if (state is GetAllCurrencyHistoricalLoading) {
              log("Loading Historical");
              return const LoadingShimmer();
            }
            else if (state is GetAllCurrencyHistoricalError) {
              return ErrorInGetCurrency(error: state.error);
            }
            else if (state is GetAllCurrencyHistoricalSuccess) {
              log("List Historical len = ${state.data.length}");
              return AllCurrencyHistoricalBuild(data: state.data);
            }
            else {
              BlocProvider.of<CurrencyCubit>(context).geCurrencyHistorical();
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
