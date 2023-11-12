// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatefulWidget {
  const IcecreamView({super.key});

  @override
  State<IcecreamView> createState() => _IcecreamViewState();
}

class _IcecreamViewState extends State<IcecreamView> {
  Map<String, dynamic>? decodedIcrecreams;
  @override
  void initState() {
    super.initState();
    loadIcecreams();
  }

  Future<void> loadIcecreams() async {
    final rawIcecreams =
        await rootBundle.loadString("assets/data/icecream.json");
    await Future.delayed(Duration(seconds: 1));
    decodedIcrecreams = jsonDecode(rawIcecreams);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "IceCream",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We have something yummy for you.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (decodedIcrecreams != null)
                  Text("IceCreams are here")
                else
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
