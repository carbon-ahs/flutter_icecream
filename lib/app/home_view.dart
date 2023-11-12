// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:icecream/icecream/icecream_view_stateless.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IcecreamView(),
      ),
    );
  }
}
