//Comparado ao dto
// ter from map
import 'package:decimal/decimal.dart';

class CoinModel {
  String ticker;
  String nameCoin;
  double currentPrice;
  double variation;
  double? coinBalance;
  String iconCoin;
  List<Decimal>? prices;
  late double? percent;

  CoinModel({
    required this.ticker,
    required this.nameCoin,
    required this.currentPrice,
    required this.variation,
    this.coinBalance,
    required this.iconCoin,
    this.prices,
  });

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      ticker: map['symbol'] ?? '',
      nameCoin: map['name'] ?? '',
      currentPrice: map['current_price'] ?? '',
      variation: map['price_change_24h'] ?? '',
      //coinBalance: map['price_change_24h'] ?? '',
      iconCoin: map['image'] ?? '',
      //prices: map['code'] ?? '',
    );
  }
}
