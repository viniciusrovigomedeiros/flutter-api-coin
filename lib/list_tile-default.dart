import 'package:flutter/material.dart';

class ListTileDefault extends StatelessWidget {
  final String moeda;
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          radius: 25,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
              bottomLeft: Radius.circular(25)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nomeMoeda,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              moeda,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 20),
        ),
        tileColor: const Color.fromARGB(255, 255, 255, 255),
        trailing: const Icon(Icons.arrow_drop_down_circle_rounded),
        //enabled: true,
        //selected: false,
        dense: false,
      ),
    );
  }
}
