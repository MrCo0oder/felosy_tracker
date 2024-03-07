import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceCardInfoWidget extends StatelessWidget {
  final String title;
  final double subTitle;
  final bool isUp;
  const BalanceCardInfoWidget({
    super.key, required this.title, required this.subTitle, required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.2)),
          height: 30,
          width: 30,
          child:isUp? Icon(
            CupertinoIcons.up_arrow,
            color: Colors.red.shade400,
          ):Icon(
            CupertinoIcons.down_arrow,
            color: Colors.greenAccent.shade400,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            Text(
              "$subTitle",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
