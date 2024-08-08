import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Core/Utils/Global_Bloc.dart';
import 'package:medication_reminder/Core/Widgets/Buttons.dart';
import 'package:medication_reminder/Views/New%20Entry/NewEntry_Bloc.dart';
import 'package:medication_reminder/Views/Widgets/IntervalSelection.dart';
import 'package:medication_reminder/Views/Widgets/PanelTitle.dart';
import 'package:medication_reminder/Views/Widgets/SelectTime.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/MedicineType.dart';
import '../Widgets/Medicine_Type.dart';

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
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 9.h,
        elevation: 0,
        title: Center(
            child: Text(
          'Add New Medicine',
          style: TextStyle(
              color: kColor, fontWeight: FontWeight.w500, fontSize: 20.sp),
        )),
        iconTheme: IconThemeData(
          color: kColor,
          size: 23.sp,
        ),
        backgroundColor: kScaffold,
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
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColor, width: 2.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2.5)),
                    hintText: 'Enter Medicine Name',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: kTextColor),
                  cursorColor: kPrimaryColor,
                ),
                SizedBox(
                  height: 1.h,
                ),
                const PanelTitle(
                  title: 'Dosage in mg ',
                  isRequired: false,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: dosageController,
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColor, width: 2.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2.5)),
                    hintText: 'Enter dosage in mg',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color:kPrimaryColor,
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: kTextColor),
                  cursorColor: kPrimaryColor,
                ),
                SizedBox(
                  height: 1.h,
                ),
                const PanelTitle(title: 'Medicine Type', isRequired: false),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
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
                                isSelected: snapshot.data == MedicineType.pills
                                    ? true
                                    : false,
                                medicineType: MedicineType.pills,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              MedicineTypee(
                                name: 'Syrup',
                                image: "Assets/Icons/syrup.png",
                                isSelected: snapshot.data == MedicineType.syrup
                                    ? true
                                    : false,
                                medicineType: MedicineType.syrup,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              MedicineTypee(
                                name: 'Syringe',
                                image: "Assets/Icons/syringe.png",
                                isSelected:
                                    snapshot.data == MedicineType.syringe
                                        ? true
                                        : false,
                                medicineType: MedicineType.syringe,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              MedicineTypee(
                                name: 'Nasal',
                                image: "Assets/Icons/nasal-spray (1).png",
                                isSelected: snapshot.data == MedicineType.nasal
                                    ? true
                                    : false,
                                medicineType: MedicineType.nasal,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              MedicineTypee(
                                name: 'Eye Drops',
                                image: "Assets/Icons/eye-drops.png",
                                isSelected:
                                    snapshot.data == MedicineType.eyeDrops
                                        ? true
                                        : false,
                                medicineType: MedicineType.eyeDrops,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              MedicineTypee(
                                name: 'Ear Drops',
                                image: "Assets/Icons/ear-drops.png",
                                isSelected:
                                    snapshot.data == MedicineType.earDrops
                                        ? true
                                        : false,
                                medicineType: MedicineType.earDrops,
                              )
                            ],
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 2.2.h,
                ),
                const PanelTitle(title: "Interval Selection", isRequired: true),
                const IntervalSelection(),
                const PanelTitle(title: "Starting Time", isRequired: true),
                const SelectTime(),
                SizedBox(
                  height: 1.h,
                ),
                const ConfirmButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
