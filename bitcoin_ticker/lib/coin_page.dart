import 'package:bitcoin_ticker/data/coin_data.dart';
import 'package:bitcoin_ticker/widgets/coin_text_widget.dart';
import 'package:flutter/material.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {

  String dropdownValue = currenciesList.first;
  CoinData coinData = CoinData();
  String rateBTC = '?';
  String rateETH = '?';
  String rateLTC = '?';

  void setValues() async {
    String tempRateBTC = await coinData.getCurrencyValue("BTC", dropdownValue);
    String tempRateETH = await coinData.getCurrencyValue("ETH", dropdownValue);
    String tempRateLTC = await coinData.getCurrencyValue("LTC", dropdownValue);
    setState(() {
      rateBTC = tempRateBTC;
      rateETH = tempRateETH;
      rateLTC = tempRateLTC;
    });
  }

  @override
  void initState() {
    super.initState();
    setValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('🤑 Coin Ticker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoinTextWidget(money: '1 BTC = $rateBTC $dropdownValue'),
                CoinTextWidget(money: '1 ETH = $rateETH $dropdownValue'),
                CoinTextWidget(money: '1 LTC = $rateLTC $dropdownValue')
              ],
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.blue,
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    dropdownColor: Colors.black87,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                    underline: Container(
                      height: 0,
                    ),
                    iconEnabledColor: Colors.white,
                    onChanged: (String? value) {
                      dropdownValue = value!;
                      setValues();
                    },
                    items: currenciesList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

