// ignore: file_names
import 'package:flutter/material.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_screen_body.dart';

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
