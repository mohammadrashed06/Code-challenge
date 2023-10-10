import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 11),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey[300]!,
            margin: const EdgeInsets.all(11),
          );
        },
      ),
    );
  }
}
