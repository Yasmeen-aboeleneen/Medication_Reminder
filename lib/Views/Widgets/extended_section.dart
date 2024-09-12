// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:medication_reminder/Models/medicine.dart';

import 'extended_info_table.dart';

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({
    super.key,
    required this.medicine,
  });
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTable(
          fieldTitle: 'Medicine Type',
          fieldinfo: medicine.medicineType == 'none'
              ? 'Not Specified'
              : medicine.medicineType!,
        ),
        ExtendedInfoTable(
          fieldTitle: 'Dose Interval',
          fieldinfo:
              'Every ${medicine.interval} hours  || ${medicine.interval == 24 ? "One time a day" : "${(24 / medicine.interval!).floor()} times a day"}',
        ),
        ExtendedInfoTable(
          fieldTitle: 'Start Time',
          fieldinfo:
              '${medicine.startTime![0]}${medicine.startTime![1]}:${medicine.startTime![2]}${medicine.startTime![3]}',
        )
      ],
    );
  }
}
