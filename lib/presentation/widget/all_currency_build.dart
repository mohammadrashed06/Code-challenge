import 'package:flutter/material.dart';

import '../../data/models/currency.dart';

class AllCurrencyBuild extends StatelessWidget {
  final List<Datum> data;

  const AllCurrencyBuild({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final currency = data[index];
        return ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: const EdgeInsets.all(11),
          iconColor: Theme.of(context).primaryColor,
          collapsedIconColor: Colors.black45,
          title: Text(currency.name ?? ""),
          subtitle: Text(currency.code ?? ""),
          leading: _buildImage(currency.imageUrl),
          children: [
            _buildChildrenText(context,
                title: "Name Plural: ", data: currency.namePlural),
            _buildChildrenText(context,
                title: "Symbol Native: ", data: currency.symbolNative),
            _buildChildrenText(context,
                title: "Symbol: ", data: currency.symbol),
            _buildChildrenText(context,
                title: "Decimal Digits: ",
                data: currency.decimalDigits.toString()),
            _buildChildrenText(context,
                title: "Rounding: ", data: currency.rounding.toString()),
          ],
        );
      },
    );
  }

  FadeInImage _buildImage(String imageUrl) {
    return FadeInImage(
      image: NetworkImage(imageUrl),
      fit: BoxFit.cover,
      height: 20,
      placeholder: const AssetImage("assets/placeholder_flag.png"),
      placeholderFit: BoxFit.cover,
      placeholderErrorBuilder: (context, error, stackTrace) {
      return Image.asset(
          "assets/placeholder_flag.png",
          height: 20,
        );
      },
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/placeholder_flag.png",
          height: 20,
        );
      },
    );
  }

  Align _buildChildrenText(
    BuildContext context, {
    required String title,
    required String? data,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: data ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
