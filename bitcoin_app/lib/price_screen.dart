import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_app/coin_data.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bitcoin_app/coin_data.dart';

class PriceScreen extends StatefulWidget {
  PriceScreen({this.coinData});
  final coinData;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  double? rate;
  int? ate;
  int? ratrint;

  String? selectedCurrency = 'USD';
  String? assetIdBase;
  String? assetIdQuote;
  Cion coin = Cion();
  void initState() {
    super.initState();
    getData(widget.coinData);
  }

  void getData(dynamic data) {
    setState(() {
      if (data == null) {
        ratrint = null;
        assetIdQuote = selectedCurrency;
      } else {
        assetIdBase = data["asset_id_base"];
        assetIdQuote = data["asset_id_quote"];
        rate = data["rate"];
        ratrint = rate?.toInt();
      }
    });
  }

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>>? dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) async {
          dynamic d = await coin.gitNetworkData(value);
          setState(() {
            selectedCurrency = value;
            getData(d);
          });
        });
  }

  CupertinoPicker getIosPicker() {
    List<Text> listitem = [];
    for (String currency in currenciesList) {
      listitem.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selecteIndex) async {
        dynamic n = await coin.gitNetworkData(currenciesList[selecteIndex]);
        setState(() {
          selectedCurrency = currenciesList[selecteIndex];
          getData(n);
        });
      },
      children: listitem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🤑 Coin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  "1 BTC = $ratrint $selectedCurrency ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                getDropdownButton(), // Platform.isIOS ? getIosPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
