// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icecream/models/icecream.dart';

class IcecreamView extends StatelessWidget {
  IcecreamView({super.key});

  // Future<IcecreamData> loadIcecreams() async {
  Future<List<Icecream>?> loadIcecreams() async {
    // final Map<String, dynamic>? decodedIcrecreams;
    final rawIcecreams =
        await rootBundle.loadString("assets/data/icecream.json");
    await Future.delayed(Duration(seconds: 1));
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: loadIcecreams(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final icecreams = snapshot.data;
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width / 3,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: icecreams!.length,
                              itemBuilder: (context, index) {
                                final icecream = icecreams[index];
                                return SizedBox(
                                  width: 200,
                                  child: Card(
                                      borderOnForeground: true,
                                      clipBehavior: Clip.hardEdge,
                                      color: Colors.orange.shade200,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.network(
                                            icecream.image!,
                                            fit: BoxFit.cover,
                                            color:
                                                Colors.orange.withOpacity(0.9),
                                            colorBlendMode: BlendMode.color,
                                          ),
                                        ],
                                      ) //Text(icecream.flovor),
                                      ),
                                );
                              }),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
