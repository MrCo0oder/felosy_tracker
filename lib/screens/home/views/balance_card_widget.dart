
import 'dart:math';

import 'package:flutter/material.dart';

import 'balance_info.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({
    super.key,
    required this.size,
    required this.balance,
    required this.income,
    required this.expenses,
  });

  final Size size;
  final double balance;
  final double income;
  final double expenses;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9.5,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(
                  0, 3), // Adjust the offset for desired effect
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "\$ $balance ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 60,
                  ),
                ),
                Row(
                  children: [
                    BalanceCardInfoWidget(
                      title: "Income",
                      subTitle: income,
                      isUp: false,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    BalanceCardInfoWidget(
                      title: "Expenses",
                      subTitle: expenses,
                      isUp: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
