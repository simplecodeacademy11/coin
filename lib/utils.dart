import 'dart:convert';

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
  'ZAR',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'aaf5258f-5eff-4cf5-b258-ac0e946cf77b';

class CoinData {
  Future getAPIData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestUrl = '$coinAPIURL/$crypto/$selectedCurrency?apiKey=$apiKey';
      final url = Uri.parse(requestUrl);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("RESPONDATE");
        print(data);
        double price = data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
