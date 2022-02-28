import 'package:flutter/material.dart';
import 'package:bitcoin_app/price_screen.dart';
import 'package:bitcoin_app/loadcoindata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: LoadCoinData(),
    );
  }
}
