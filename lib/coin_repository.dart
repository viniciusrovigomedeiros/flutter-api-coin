import 'package:dio/dio.dart';

import 'coin_model.dart';
import 'home_page.dart';

class CoinRepository {
  final Dio dio;

  CoinRepository({
    required this.dio,
  });

  List<CoinModel> coins = [];

  Future<List<CoinModel>> getAllCoins() async {
    final response = await dio.get('https://api.hgbrasil.com/finance');

    coins = List.from(response.data['results'].map((coin) {
      return CoinModel.fromMap(coin);
    }));

    coins.removeAt(18);
    print(coins);

    return coins;
  }
}
