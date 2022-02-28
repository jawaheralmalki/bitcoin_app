import 'package:flutter/material.dart';
import 'package:bitcoin_app/coin_data.dart';
import 'package:bitcoin_app/price_screen.dart';

class LoadCoinData extends StatefulWidget {
  const LoadCoinData({Key? key}) : super(key: key);

  @override
  State<LoadCoinData> createState() => _LoadCoinDataState();
}

class _LoadCoinDataState extends State<LoadCoinData> {
  Cion coin = Cion();
  void initState() {
    super.initState();
    sendData();
  }

  void sendData() async {
    var data = await coin.gitNetworkData('USD');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(coinData: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
