import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coin_descrition-page.dart';
import 'coin_model.dart';
import 'coin_repository.dart';
import 'list_tile-default.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  CoinRepository repository = CoinRepository(dio: Dio());
  late Future<List<CoinModel>> coins;

  @override
  void initState() {
    coins = repository.getAllCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(37, 0, 0, 0),
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
                                'https://lh3.googleusercontent.com/ogw/AOh-ky0YNl4ms8J2jefS9bV85QN92L0k4ho7zRTBedkAaHk=s32-c-mo'))),
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
        )),
      ),
      endDrawer: const Text(''),
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFc2e59c), Color(0xFF64b3f4)]),
        ),
        child: FutureBuilder(
          future: coins,
          builder: ((context, AsyncSnapshot<List<CoinModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    'Carregando dados...',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Erro ao carregar dados...',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          CoinModel myCoin = snapshot.data![index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CoinDescritionPage()),
                                  );
                                },
                                child: ListTileDefault(
                                  moeda: myCoin.bid,
                                  nomeMoeda: myCoin.code,
                                  subtitle: myCoin.pctChange,
                                  img:
                                      'https://cdn-icons-png.flaticon.com/512/2331/2331903.png',
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
            }
          }),
        ),
      ),
    );
  }
}
