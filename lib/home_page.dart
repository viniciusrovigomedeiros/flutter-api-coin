import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/coin_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'coin_descrition-page.dart';
import 'coin_model.dart';
import 'coin_repository.dart';
import 'list_tile-default.dart';

class CoinPage extends StatefulHookConsumerWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends ConsumerState<CoinPage> {
  @override
  Widget build(BuildContext context) {
    final coins = ref.watch(coinProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Center(
                    child: Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://lh3.googleusercontent.com/ogw/AOh-ky0YNl4ms8J2jefS9bV85QN92L0k4ho7zRTBedkAaHk=s32-c-mo'),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'API Moedas',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Text(''),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const Text(''),
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFc2e59c), Color(0xFF64b3f4)]),
        ),
        child: Visibility(
          visible: coins.isNotEmpty,
          child: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, index) {
              CoinModel myCoin = coins[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CoinDescritionPage()),
                      );
                    },
                    child: ListTileDefault(
                      nomeMoeda: myCoin.nameCoin,
                      moeda: myCoin.ticker,
                      subtitle: myCoin.variation.toStringAsFixed(2),
                      img: myCoin.iconCoin,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
