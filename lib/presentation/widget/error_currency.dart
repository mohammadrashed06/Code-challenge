import 'package:flutter/material.dart';

class ErrorInGetCurrency extends StatelessWidget {
  const ErrorInGetCurrency({
    Key? key,
    required this.error,
  }) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
