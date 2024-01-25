import 'package:flutter/material.dart';
import 'package:medication_reminder/Screens/NewEntryScreenBody.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: NewEntryScreenBody());
  }
}
