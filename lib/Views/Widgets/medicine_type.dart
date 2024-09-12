import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';

class MedicineTypee extends StatelessWidget {
  const MedicineTypee({
    super.key,
    required this.name,
    required this.image,
    required this.isSelected,
    required this.medicineType, required void Function() onTap,
  });

  final String name;
  final String image;
  final bool isSelected;
  final MedicineType medicineType;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: Container(
        width: 20.w,
        height: 12.h,
        decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(colors: [kPrimary, kLightPurple])
                : const LinearGradient(colors: [kveryWhite, kveryWhite]),
            borderRadius: BorderRadius.circular(3.h)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Image.asset(
                  image,
                  height: 6.h,
                ),
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
