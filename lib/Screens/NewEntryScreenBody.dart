import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Widgets/PanelTitle.dart';
import 'package:sizer/sizer.dart';

class NewEntryScreenBody extends StatefulWidget {
  const NewEntryScreenBody({super.key});

  @override
  State<NewEntryScreenBody> createState() => _NewEntryScreenBodyState();
}

class _NewEntryScreenBodyState extends State<NewEntryScreenBody> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 9.h,
        elevation: 0,
        title: Center(
            child: Text(
          'Add New Medicine',
          style: TextStyle(
              color: KColor, fontWeight: FontWeight.w500, fontSize: 20.sp),
        )),
        iconTheme: IconThemeData(
          color: KColor,
          size: 23.sp,
        ),
      ),
      body: Padding(
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
                    borderSide: BorderSide(color: KColor, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KMainColor, width: 2.5)),
                hintText: 'Enter Medicine Name',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: KMainColor,
                ),
              ),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
              cursorColor: KMainColor,
            ),
            SizedBox(
              height: 4.h,
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
                    borderSide: BorderSide(color: KColor, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KMainColor, width: 2.5)),
                hintText: 'Enter dosage in mg',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: KMainColor,
                ),
              ),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
              cursorColor: KMainColor,
            ),
          ],
        ),
      ),
    );
  }
}
