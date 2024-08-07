import 'package:flutter/material.dart';

import 'HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  HomeScreenBody());
  }
}
