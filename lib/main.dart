import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

const url = 'https://api.hgbrasil.com/finance';

void main() async {
  //print(await getData());

  runApp(
    MaterialApp(
      home: CoinPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

Future<Map> getData() async {
  final response = await Dio().get(url);
  //Map<String, dynamic> coinMap = (response.data['results']['currencies']);

  return (response.data);
}
