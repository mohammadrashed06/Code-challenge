import 'package:flutter/material.dart';

import '../../data/models/currency_historical.dart';

class AllCurrencyHistoricalBuild extends StatelessWidget {
  final List<DatumHistorical> data;

  const AllCurrencyHistoricalBuild({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(11),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final historical = data[index];
        return ListTile(
          title: Text(historical.code),
          subtitle: Text("Value = ${historical.value.toString()}"),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.grey);
      },
    );
  }
}
