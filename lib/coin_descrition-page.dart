import 'package:flutter/material.dart';

class CoinDescritionPage extends StatefulWidget {
  const CoinDescritionPage({Key? key}) : super(key: key);

  @override
  State<CoinDescritionPage> createState() => _CoinDescritionPageState();
}

class _CoinDescritionPageState extends State<CoinDescritionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        width: double.maxFinite,
        height: 200,
        color: Colors.pink,
        child: Center(
            child: Text(
          'Dolar',
          style: TextStyle(fontSize: 50),
        )),
      ),
    );
  }
}
