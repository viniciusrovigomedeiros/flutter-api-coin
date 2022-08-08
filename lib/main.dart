import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: ProviderScope(child: CoinPage()),
      debugShowCheckedModeBanner: false,
    ),
  );
}
