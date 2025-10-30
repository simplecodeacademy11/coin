import 'package:coin/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Map<String, String> coinValues = {};
  String selectedCurrency = 'AUD';

  Column makeCards() {
    List<CrytoCard> list = [];
    for (String crypto in cryptoList) {
      list.add(CrytoCard(cryptoCurrency: crypto, selectedValue: selectedCurrency, value: coinValues[crypto]));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: list);
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String value in currenciesList) {
      pickerItems.add(Text(value));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedCurrency = currenciesList[value];
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coin')),
      body: Column(
        children: [
          makeCards(),
          Container(
            height: 150,
            color: Colors.blue,
            padding: EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomCenter,
            child: iosPicker(),
          ),
        ],
      ),
    );
  }
}

class CrytoCard extends StatelessWidget {
  const CrytoCard({super.key, this.cryptoCurrency, this.value, this.selectedValue});
  final String? value;
  final String? selectedValue;
  final String? cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.blue,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 28),
          child: Text(
            '1 $cryptoCurrency = $value $selectedValue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
