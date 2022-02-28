import 'package:flutter/material.dart';
//import 'package:bitcoin_app/coin_data.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Cion {
  Future gitNetworkData(String? IdQuote) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$IdQuote?apiKey=E3452D58-8B15-43BC-A9F1-72514DA740AF'));

    if (response.statusCode == 200) {
      String data = response.body;
      var m = jsonDecode(data);
      return m;
    } else {
      print(response.statusCode);
    }
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}
