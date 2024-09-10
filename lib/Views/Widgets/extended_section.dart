import 'package:flutter/material.dart';

import 'extended_info_table.dart';

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTable(
          fieldTitle: 'Medicine Type',
          fieldinfo: 'Pills',
        ),
        ExtendedInfoTable(
          fieldTitle: 'Dose Interval',
          fieldinfo: 'Every 8 hours| 3 times a day',
        ),
        ExtendedInfoTable(
          fieldTitle: 'Start Time',
          fieldinfo: '01:15',
        )
      ],
    );
  }
}
