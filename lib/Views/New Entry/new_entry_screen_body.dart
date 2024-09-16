import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Core/Utils/Classes/notifications_service.dart';
import 'package:medication_reminder/Core/Widgets/custom_button.dart';
import 'package:medication_reminder/Core/Widgets/custom_text_field.dart';
import 'package:medication_reminder/Models/errors.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';
import 'package:medication_reminder/Views/New%20Entry/success_screen.dart';
import 'package:medication_reminder/Views/Widgets/interval_selection.dart';
import 'package:medication_reminder/Views/Widgets/medicine_row.dart';
import 'package:medication_reminder/Views/Widgets/panel_title.dart';
import 'package:medication_reminder/Views/Widgets/select_time.dart';
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

    NotificationsService.init(); // Initialize notifications service
    initializeErrorListen();
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
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 1.h),
                const PanelTitle(
                  title: 'Dosage in mg',
                  isRequired: false,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Enter dosage in mg',
                  textEditingController: dosageController,
                  maxLen: 5,
                  keyboardType: TextInputType.number,
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

                    // Validation
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

                    final globalBloc =
                        Provider.of<GlobalBloc>(context, listen: false);

                    for (var medicine in globalBloc.medicineList$.value) {
                      if (medicineName == medicine.medicineName) {
                        _newEntryBloc.submitError(EntryError.nameDuplicate);
                        return;
                      }
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
                        .split('.')
                        .last;

                    int interval = _newEntryBloc.selectedIntervals!.value;
                    String startTime = _newEntryBloc.selectedTimeOfDay!.value;

                    List<int> notificationIDs =
                        makeIDs(24 ~/ _newEntryBloc.selectedIntervals!.value);

                    Medicine newEntryMedicine = Medicine(
                      notificationIDs: notificationIDs,
                      medicineName: medicineName,
                      dosage: dosage,
                      medicineType: medicineType,
                      interval: interval,
                      startTime: startTime,
                    );

                    globalBloc.updateMedicineList(newEntryMedicine);
                    NotificationsService.scheduleNotification(newEntryMedicine);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessScreen()),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  colors: const [kLightPurple, kPrimary, kPrimary],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState?.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("Please enter medicine's name");
          break;
        case EntryError.nameDuplicate:
          displayError("Medicine name already exists");
          break;
        case EntryError.dosage:
          displayError("Please enter medicine's dosage");
          break;
        case EntryError.type:
          displayError("Please select medicine's type");
          break;
        case EntryError.interval:
          displayError("Please select the reminder's interval");
          break;
        case EntryError.startTime:
          displayError("Please select the reminder's time");
          break;
        case EntryError.none:
          displayError("Please enter required fields");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: kPurple,
      elevation: 3,
      showCloseIcon: true,
      content: Text(error),
      duration: const Duration(milliseconds: 2000),
    ));
  }

  List<int> makeIDs(int n) {
    var rng = Random();
    // ignore: prefer_collection_literals
    Set<int> ids = Set<int>();
    while (ids.length < n) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids.toList();
  }
}
