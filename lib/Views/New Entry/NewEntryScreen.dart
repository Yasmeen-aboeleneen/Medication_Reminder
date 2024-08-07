import 'package:flutter/material.dart';
import 'package:medication_reminder/Views/New%20Entry/NewEntryScreenBody.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({super.key});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: NewEntryScreenBody());
  }
}
