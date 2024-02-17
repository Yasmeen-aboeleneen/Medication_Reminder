import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'MedicineType.dart';

class RowOfMedType extends StatelessWidget {
  const RowOfMedType({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MedicineType(
                      name: 'Pills',
                      image: "Assets/Icons/pills.png",
                      isSelected: snapshot.data == 'Assets/Icons/syringe.png'
                          ? true
                          : false),
                  SizedBox(
                    width: 3.w,
                  ),
                  MedicineType(
                      name: 'Syrup',
                      image: "Assets/Icons/syrup.png",
                      isSelected: snapshot.data == 'Assets/Icons/syringe.png'
                          ? true
                          : false),
                  SizedBox(
                    width: 3.w,
                  ),
                  MedicineType(
                      name: 'Syringe',
                      image: "Assets/Icons/syringe.png",
                      isSelected: snapshot.data == 'Assets/Icons/syringe.png'
                          ? true
                          : false),
                  SizedBox(
                    width: 3.w,
                  ),
                  MedicineType(
                      name: 'Nasal',
                      image: "Assets/Icons/nasal-spray (1).png",
                      isSelected:
                          snapshot.data == 'Assets/Icons/nasal-spray (1).png'
                              ? true
                              : false),
                  SizedBox(
                    width: 3.w,
                  ),
                  MedicineType(
                      name: 'Eye Drops',
                      image: "Assets/Icons/eye-drops.png",
                      isSelected: snapshot.data == 'Assets/Icons/eye-drops.png'
                          ? true
                          : false),
                  SizedBox(
                    width: 3.w,
                  ),
                  MedicineType(
                      name: 'Ear Drops',
                      image: "Assets/Icons/ear-drops.png",
                      isSelected: snapshot.data == 'Assets/Icons/ear-drops.png'
                          ? true
                          : false)
                ],
              ),
            );
          }),
    );
  }
}
