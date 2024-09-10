// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Core/Widgets/custom_button.dart';
import 'package:medication_reminder/Models/errors.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';
import 'package:medication_reminder/Views/Widgets/interval_selection.dart';
import 'package:medication_reminder/Views/Widgets/panel_title.dart';
import 'package:medication_reminder/Views/Widgets/select_time.dart';
import 'package:medication_reminder/Core/Widgets/custom_text_field.dart';
import 'package:medication_reminder/Views/Widgets/medicine_row.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewEntryScreenBody extends StatefulWidget {
  const NewEntryScreenBody({super.key});

  @override
  State<NewEntryScreenBody> createState() => _NewEntryScreenBodyState();
}

class _NewEntryScreenBodyState extends State<NewEntryScreenBody> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kveryWhite,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kveryWhite,
        toolbarHeight: 9.h,
        elevation: 0,
        title: Center(
            child: Text(
          'Add New Medicine',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        )),
      ),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PanelTitle(
                  title: 'Medicine Name',
                  isRequired: true,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Enter Medicine Name',
                  textEditingController: nameController,
                  maxLen: 30,
                ),
                SizedBox(height: 1.h),
                const PanelTitle(
                  title: 'Dosage in mg ',
                  isRequired: false,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Enter dosage in mg',
                  textEditingController: dosageController,
                  maxLen: 5,
                ),
                SizedBox(height: 1.h),
                const PanelTitle(title: 'Medicine Type', isRequired: false),
                SizedBox(height: 1.h),
                const MedicineRow(),
                SizedBox(height: 2.2.h),
                const PanelTitle(title: "Interval Selection", isRequired: true),
                const IntervalSelection(),
                const PanelTitle(title: "Starting Time", isRequired: true),
                const SelectTime(),
                SizedBox(height: 1.5.h),
                Center(
                    child: CustomButton(
                  text: 'Confirm',
                  onTap: () {
                    String? medicineName;
                    int? dosage;

                    if (nameController.text.isEmpty) {
                      _newEntryBloc.submitError(EntryError.nameNull);
                      return;
                    } else {
                      medicineName = nameController.text;
                    }

                    if (dosageController.text.isEmpty) {
                      dosage = 0;
                    } else {
                      dosage = int.parse(dosageController.text);
                    }

                    for (var medicine in GlobalBloc().medicineList$!.value) {
                      if (medicineName == medicine.medicineName) {
                        _newEntryBloc.submitError(EntryError.nameDuplicate);
                        return;
                      }
                      if (_newEntryBloc.selectedIntervals!.value == 0) {
                        _newEntryBloc.submitError(EntryError.interval);
                        return;
                      }
                      if (_newEntryBloc.selectedTimeOfDay!.value == 'None') {
                        _newEntryBloc.submitError(EntryError.startTime);
                        return;
                      }

                      String medicineType = _newEntryBloc
                          .selectedMedicineType!.value
                          .toString()
                          .substring(13);

                      int interval = _newEntryBloc.selectedIntervals!.value;
                      String startTime = _newEntryBloc.selectedTimeOfDay!.value;

                      List<int> intIDs =
                          makeIDs(24 / _newEntryBloc.selectedIntervals!.value);

                      List<String> notificationIDs =
                          intIDs.map((i) => i.toString()).toList();

                      Medicine newEntryMedicine = Medicine(
                          notificationIDs: notificationIDs,
                          medicineName: medicineName,
                          dosage: dosage,
                          medicineType: medicineType,
                          interval: interval,
                          startTime: startTime);

                      GlobalBloc().updateMedicineList(newEntryMedicine);
                    }
                  },
                  colors: const [kLightPurple, kPrimary, kPrimary],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i > n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }
}
