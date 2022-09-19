import 'package:dio/dio.dart';

import 'coin_model.dart';

class CoinRepository {
  final Dio dio = Dio();
  final String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  Future<List<CoinModel>> getAllCoins() async {
    final response = await dio.get(url);

    List<CoinModel> coins = [];

    print(response.data);
    coins = List.from(response.data.map((char) {
      return CoinModel.fromMap(char);
    }));

    return coins;
  }
}
