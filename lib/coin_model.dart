class CoinModel {
  List results;
  List currences;
  String USD;
  String EUR;
  String GBP;
  String BTC;

  CoinModel({
    required this.results,
    required this.currences,
    required this.USD,
    required this.EUR,
    required this.GBP,
    required this.BTC,
  });

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      results: List.from(map['results']),
      currences: List.from(map['currences']),
      USD: map['USD'] ?? '',
      EUR: map['EUR'] ?? '',
      GBP: map['GBP'] ?? '',
      BTC: map['BTC'] ?? '',
    );
  }
}
