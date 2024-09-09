import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Widgets/custom_button.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_bloc.dart';
import 'package:medication_reminder/Views/Widgets/interval_selection.dart';
import 'package:medication_reminder/Views/Widgets/PanelTitle.dart';
import 'package:medication_reminder/Views/Widgets/select_time.dart';
import 'package:medication_reminder/Views/Widgets/custom_text_field.dart';
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
                    onTap: () {},
                    colors: const [kLightPurple, kPrimary, kPrimary],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
