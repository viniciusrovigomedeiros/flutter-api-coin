import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/main.dart';

import 'coin_model.dart';
import 'coin_repository.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  CoinRepository repository = CoinRepository(dio: Dio());
  late Future<List<CoinModel>> coins;

  late double dolar;
  late double euro;
  late double GBP;
  late double BTC;

  @override
  void initState() {
    coins = repository.getAllCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('API Moedas')),
      ),
      body: FutureBuilder(
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
                CoinModel moeda = snapshot.data! as CoinModel;
                // dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                // euro = snapshot.data!['results']['currencies']['EUR']['buy'];
                // GBP = snapshot.data!['results']['currencies']['GBP']['buy'];
                // BTC = snapshot.data!['results']['currencies']['BTC']['buy'];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTileDefault(
                        moeda: dolar,
                        nomeMoeda: 'Dolar',
                        subtitle: 'subtitle',
                        img:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Dollar_Sign.svg/500px-Dollar_Sign.svg.png',
                      ),
                      const SizedBox(height: 10),
                      ListTileDefault(
                        moeda: euro,
                        nomeMoeda: 'Euro',
                        subtitle: 'subtitle',
                        img:
                            'https://cdn-icons-png.flaticon.com/512/25/25403.png',
                      ),
                      const SizedBox(height: 10),
                      ListTileDefault(
                        moeda: GBP,
                        nomeMoeda: 'Libra',
                        subtitle: 'subtitle',
                        img:
                            'https://cdn-icons-png.flaticon.com/512/20/20977.png',
                      ),
                      const SizedBox(height: 10),
                      ListTileDefault(
                        moeda: BTC,
                        nomeMoeda: 'Bitcoin',
                        subtitle: 'subtitle',
                        img:
                            'https://cdn-icons-png.flaticon.com/512/25/25180.png',
                      ),
                    ],
                  ),
                );
              }
          }
        }),
      ),
    );
  }
}

class ListTileDefault extends StatelessWidget {
  final double moeda;
  final String nomeMoeda;
  final String subtitle;
  final String img;

  const ListTileDefault({
    Key? key,
    required this.moeda,
    required this.nomeMoeda,
    required this.subtitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.black,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(img),
                ),
              ),
            ),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nomeMoeda,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '\$${moeda}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      subtitle: Text(subtitle),
      tileColor: const Color.fromARGB(97, 7, 143, 255),
      trailing: Icon(Icons.arrow_drop_down_circle_rounded),
      enabled: true,
      selected: false,
      dense: true,
    );
  }
}
