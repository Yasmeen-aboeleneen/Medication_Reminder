import 'package:flutter/material.dart';
import 'package:medication_reminder/Views/Details/DetailsScreen.dart';
import 'package:medication_reminder/Views/Widgets/MedicineCard.dart';
import 'package:sizer/sizer.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Flexible(
    //   child: Text(
    //     'You are in a good health🥰 ',
    //     style: TextStyle(
    //       fontSize: 25,
    //       color: kMainColor,
    //       fontWeight: FontWeight.w500,
    //     ),
    //     textAlign: TextAlign.center,
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
                splashColor: Colors.grey,
                highlightColor: Colors.white,
                onTap: () {
                  // go to details page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicineDetailsScreen()));
                },
                child: const MedicineCard()),
          );
        },
      ),
    );
  }
}
