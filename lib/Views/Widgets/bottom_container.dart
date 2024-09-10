import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Views/Details/details_screen.dart';
import 'package:medication_reminder/Views/Widgets/medicine_card.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          splashColor: Colors.grey,
          highlightColor: kveryWhite,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MedicineDetailsScreen(),
              ),
            );
          },
          child: const MedicineCard(),
        );
      },
    );
  }
}
