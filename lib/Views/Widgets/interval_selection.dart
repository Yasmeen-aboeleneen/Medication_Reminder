import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({super.key});

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [0, 2, 4, 6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Remind me every',
          style: TextStyle(
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownButton(
            dropdownColor: kveryWhite,
            borderRadius: BorderRadius.circular(25),
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'Select an interval',
                    style: TextStyle(
                        fontSize: 11.5.sp, fontWeight: FontWeight.w500),
                  )
                : null,
            elevation: 3,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ));
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal!;
                newEntryBloc.updateInterval(newVal);
              });
            }),
        Text(
          _selected == 1 ? 'Hour' : 'Hours',
          style: TextStyle(
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
