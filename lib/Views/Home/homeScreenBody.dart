import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Views/New%20Entry/NewEntryScreen.dart';
import 'package:medication_reminder/Views/Widgets/BottomContainer.dart';
import 'package:medication_reminder/Views/Widgets/HeaderPart.dart';
import 'package:medication_reminder/Views/Widgets/TopCounter.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kScaffold,
        floatingActionButton: InkResponse(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewEntryScreen()));
          },
          child: SizedBox(
            width: w * .2,
            height: h * .1,
            child: Card(
              shadowColor: kColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: kPrimaryColor,
              child: Icon(
                Icons.add_rounded,
                size: w * .12,
                color: kScaffold,
              ),
            ),
          ),
        ),
        body: const Column(children: [
          HeaderPart(),
          SizedBox(
            height: 1.5,
          ),
          TopCounter(),
          SizedBox(height: .2),
          Expanded(child: BottomContainer()),
        ]));
  }
}
