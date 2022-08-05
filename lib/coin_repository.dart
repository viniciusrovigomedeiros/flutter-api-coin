import 'package:dio/dio.dart';

import 'coin_model.dart';

class CoinRepository {
  final Dio dio;

  CoinRepository({
    required this.dio,
  });

  List<CoinModel> coins = [];
  late CoinModel coin;
  late CoinModel coin1;
  late CoinModel coin2;
  Future<List<CoinModel>> getAllCoins() async {
    final response = await dio
        .get('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL');

    coins.add(coin = CoinModel.fromMap(response.data['USDBRL']));
    coins.add(coin = CoinModel.fromMap(response.data['EURBRL']));
    coins.add(coin = CoinModel.fromMap(response.data['BTCBRL']));

    return coins;

    //print(response.data['USDBRL']);
    // coins = List.from(response.data['USDBRL'].map((coin) {
    //   return CoinModel.fromMap(coin);
    // }));
  }
}
