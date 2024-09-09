import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';
import 'package:medication_reminder/Views/New%20Entry/NewEntry_Bloc.dart';
import 'package:medication_reminder/Views/Widgets/MedicineType.dart';
import 'package:sizer/sizer.dart';

class MedicineRow extends StatefulWidget {
  const MedicineRow({super.key});

  @override
  State<MedicineRow> createState() => _MedicineRowState();
}

class _MedicineRowState extends State<MedicineRow> {
  late NewEntryBloc _newEntryBloc;

  @override
  void initState() {
    super.initState();
    _newEntryBloc = NewEntryBloc();
  }

  @override
  void dispose() {
    _newEntryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: StreamBuilder<MedicineType>(
            stream: _newEntryBloc.selectedMedicineType,
            builder: (context, snapshot) {
              return Row(
                children: [
                  MedicineTypee(
                    name: 'Pills',
                    image: "Assets/Icons/pills.png",
                    isSelected:
                        snapshot.data == MedicineType.pills ? true : false,
                    medicineType: MedicineType.pills,
                  ),
                  SizedBox(width: 3.w),
                  MedicineTypee(
                    name: 'Syrup',
                    image: "Assets/Icons/syrup.png",
                    isSelected:
                        snapshot.data == MedicineType.syrup ? true : false,
                    medicineType: MedicineType.syrup,
                  ),
                  SizedBox(width: 3.w),
                  MedicineTypee(
                    name: 'Syringe',
                    image: "Assets/Icons/syringe.png",
                    isSelected:
                        snapshot.data == MedicineType.syringe ? true : false,
                    medicineType: MedicineType.syringe,
                  ),
                  SizedBox(width: 3.w),
                  MedicineTypee(
                    name: 'Nasal',
                    image: "Assets/Icons/nasal-spray (1).png",
                    isSelected:
                        snapshot.data == MedicineType.nasal ? true : false,
                    medicineType: MedicineType.nasal,
                  ),
                  SizedBox(width: 3.w),
                  MedicineTypee(
                    name: 'Eye Drops',
                    image: "Assets/Icons/eye-drops.png",
                    isSelected:
                        snapshot.data == MedicineType.eyeDrops ? true : false,
                    medicineType: MedicineType.eyeDrops,
                  ),
                  SizedBox(width: 3.w),
                  MedicineTypee(
                    name: 'Ear Drops',
                    image: "Assets/Icons/ear-drops.png",
                    isSelected:
                        snapshot.data == MedicineType.earDrops ? true : false,
                    medicineType: MedicineType.earDrops,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
