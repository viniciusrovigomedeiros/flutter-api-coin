import 'dart:io';

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

  bool isNegative() {
    if (subtitle[0] == '-') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
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
              SizedBox(
                width: 170,
                height: 30,
                child: Text(
                  nomeMoeda,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: (subtitle[0] == '-') ? Colors.red : Colors.green,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          subtitle: Text(
            moeda,
            style: const TextStyle(fontSize: 25),
          ),
          tileColor: const Color.fromARGB(255, 255, 255, 255),
          trailing: const Icon(Icons.arrow_drop_down_circle_rounded),
          dense: false,
        ),
      ),
    );
  }
}
