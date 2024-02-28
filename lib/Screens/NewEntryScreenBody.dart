import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Core/Widgets/Buttons.dart';
import 'package:medication_reminder/Screens/NewEntry_Bloc.dart';
import 'package:medication_reminder/Widgets/IntervalSelection.dart';
import 'package:medication_reminder/Widgets/PanelTitle.dart';
import 'package:medication_reminder/Widgets/SelectTime.dart';
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
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late NewEntryBloc _newEntryBloc;
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
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
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
                      borderSide: BorderSide(color: kMainColor, width: 2.5)),
                  hintText: 'Enter Medicine Name',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: kTextColor),
                cursorColor: kMainColor,
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
                      borderSide: BorderSide(color: kMainColor, width: 2.5)),
                  hintText: 'Enter dosage in mg',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: kTextColor),
                cursorColor: kMainColor,
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
                              isSelected: snapshot.data == MedicineType.Syrup
                                  ? true
                                  : false,
                              medicineType: MedicineType.Syrup,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            MedicineTypee(
                              name: 'Syringe',
                              image: "Assets/Icons/syringe.png",
                              isSelected: snapshot.data == MedicineType.Syringe
                                  ? true
                                  : false,
                              medicineType: MedicineType.Syringe,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            MedicineTypee(
                              name: 'Nasal',
                              image: "Assets/Icons/nasal-spray (1).png",
                              isSelected: snapshot.data == MedicineType.Nasal
                                  ? true
                                  : false,
                              medicineType: MedicineType.Nasal,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            MedicineTypee(
                              name: 'Eye Drops',
                              image: "Assets/Icons/eye-drops.png",
                              isSelected: snapshot.data == MedicineType.EyeDrops
                                  ? true
                                  : false,
                              medicineType: MedicineType.EyeDrops,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            GestureDetector(
                              child: MedicineTypee(
                                name: 'Ear Drops',
                                image: "Assets/Icons/ear-drops.png",
                                isSelected:
                                    snapshot.data == MedicineType.EarDrops
                                        ? true
                                        : false,
                                medicineType: MedicineType.EarDrops,
                              ),
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
    );
  }
}
