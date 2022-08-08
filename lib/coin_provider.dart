import 'package:flutter_application_1/coin_model.dart';
import 'package:flutter_application_1/coin_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinProvider = StateNotifierProvider<CoinNotifier, List<CoinModel>>(
  (ref) => CoinNotifier(),
);
