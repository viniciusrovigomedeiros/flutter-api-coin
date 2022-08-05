import 'dart:convert';

class CoinModel {
  final String code;
  final String pctChange;
  final String bid;

  CoinModel({
    required this.code,
    required this.pctChange,
    required this.bid,
  });

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      code: map['code'] ?? '',
      pctChange: map['pctChange'] ?? '',
      bid: map['bid'] ?? '',
    );
  }
}
