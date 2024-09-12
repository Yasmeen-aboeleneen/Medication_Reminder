import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';
import 'package:medication_reminder/Views/Widgets/medicine_type.dart';
import 'package:provider/provider.dart';
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
    // You can remove the creation of a new bloc here, and instead access it from the Provider in the parent widget
  }

  @override
  Widget build(BuildContext context) {
    // Accessing the NewEntryBloc from the Provider passed by the parent widget
    _newEntryBloc = Provider.of<NewEntryBloc>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: StreamBuilder<MedicineType>(
          stream: _newEntryBloc.selectedMedicineType,
          builder: (context, snapshot) {
            // Check if data is present in the stream
            final medicineType = snapshot.data ?? MedicineType.none;

            return Row(
              children: [
                MedicineTypee(
                  name: 'pills',
                  image: "Assets/Icons/pills.png",
                  isSelected: medicineType == MedicineType.pills,
                  medicineType: MedicineType.pills,
                  onTap: () =>
                      _newEntryBloc.updateSelectedMedicine(MedicineType.pills),
                ),
                SizedBox(width: 3.w),
                MedicineTypee(
                  name: 'syrup',
                  image: "Assets/Icons/syrup.png",
                  isSelected: medicineType == MedicineType.syrup,
                  medicineType: MedicineType.syrup,
                  onTap: () =>
                      _newEntryBloc.updateSelectedMedicine(MedicineType.syrup),
                ),
                SizedBox(width: 3.w),
                MedicineTypee(
                  name: 'syringe',
                  image: "Assets/Icons/syringe.png",
                  isSelected: medicineType == MedicineType.syringe,
                  medicineType: MedicineType.syringe,
                  onTap: () => _newEntryBloc
                      .updateSelectedMedicine(MedicineType.syringe),
                ),
                SizedBox(width: 3.w),
                MedicineTypee(
                  name: 'nasal',
                  image: "Assets/Icons/nasal-spray (1).png",
                  isSelected: medicineType == MedicineType.nasal,
                  medicineType: MedicineType.nasal,
                  onTap: () =>
                      _newEntryBloc.updateSelectedMedicine(MedicineType.nasal),
                ),
                SizedBox(width: 3.w),
                MedicineTypee(
                  name: 'eyeDrops',
                  image: "Assets/Icons/eye-drops.png",
                  isSelected: medicineType == MedicineType.eyeDrops,
                  medicineType: MedicineType.eyeDrops,
                  onTap: () => _newEntryBloc
                      .updateSelectedMedicine(MedicineType.eyeDrops),
                ),
                SizedBox(width: 3.w),
                MedicineTypee(
                  name: 'earDrops',
                  image: "Assets/Icons/ear-drops.png",
                  isSelected: medicineType == MedicineType.earDrops,
                  medicineType: MedicineType.earDrops,
                  onTap: () => _newEntryBloc
                      .updateSelectedMedicine(MedicineType.earDrops),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
