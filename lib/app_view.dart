import 'package:felosy_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Felosy",
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Color(0xfff6f2fd),
            onBackground: Colors.black,
            primary: Color(0xff00B2e7),
            secondary: Color(0xffe064f7),
            tertiary: Color(0xffff8d6c),
        outline: Colors.grey),
      ),
      home: const HomeScreen(),
    );
  }
}
