import 'dart:convert' as convert;
import 'package:bitcoin_ticker/data/secrets.dart';
import 'package:http/http.dart' as http;

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

class CoinData {

  CoinData();

  Future<String> getCurrencyValue(String cryptoCurrency, String fiatCurrency) async {
    try {
      String url = "https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$fiatCurrency";
      var response = await http.get(
          Uri.parse(url),
          headers: {
            "X-CoinAPI-Key" : apiKey,
          }
      );
      if (response.statusCode == 200) {
        var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
        return (jsonResponse["rate"] as double).toStringAsFixed(4);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (err) {
      print(err);
    }

    return '?';
  }
}
