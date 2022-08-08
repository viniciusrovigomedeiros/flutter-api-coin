import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'coin_model.dart';
import 'coin_repository.dart';

class CoinNotifier extends StateNotifier<List<CoinModel>> {
  CoinNotifier() : super([]) {
    getAllCoins();
  }

  final _repository = CoinRepository(dio: Dio());

  getAllCoins() async {
    state = await _repository.getAllCoins();
  }
}
