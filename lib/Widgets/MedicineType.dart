import 'package:flutter/material.dart';
import 'package:medication_reminder/Widgets/Medicine_Type.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Screens/NewEntry_Bloc.dart';

class MedicineTypee extends StatelessWidget {
  const MedicineTypee({
    Key? key,
    required this.name,
    required this.image,
    required this.isSelected,
    required this.medicineType,
  }) : super(key: key);

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
            color: isSelected ? kCcolor : kSecondaryColor,
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
                style: TextStyle(
                    color: kMainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
