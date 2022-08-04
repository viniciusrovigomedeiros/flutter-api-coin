import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double dolar;
  late double euro;
  late double GBP;
  late double BTC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('API Moedas')),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: ((context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
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
                dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                euro = snapshot.data!['results']['currencies']['EUR']['buy'];
                GBP = snapshot.data!['results']['currencies']['GBP']['buy'];
                BTC = snapshot.data!['results']['currencies']['BTC']['buy'];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(97, 7, 143, 255),
                    ),
                    height: 200,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Dolar: ',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                'USD  \$${dolar}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Euro: ',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                'EUR  \$${euro}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'GBP: ',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                'GBP  \$${GBP}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bitcoin: ',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                '\$${BTC}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          }
        }),
      ),
    );
  }
}
