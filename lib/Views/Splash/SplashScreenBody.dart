import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Views/Home/HomeScreen.dart';
import 'package:medication_reminder/Views/Widgets/customButton.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kblue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: h * .59,
            child: Image.asset(
              "Assets/Images/img.png",
              height: h * .55,
            ),
          ),
          SizedBox(height: h * .09),
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19),
            child: Container(
              height: h * .3,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: kScaffold),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      'Meds Control',
                      style: TextStyle(
                          fontSize: w * .1,
                          fontWeight: FontWeight.bold,
                          color: kColor),
                    ),
                  ),
                  Text(
                    'Organize your medicine time',
                    style: TextStyle(
                        fontSize: w * .033,
                        fontWeight: FontWeight.bold,
                        color: kCcolor),
                  ),
                  SizedBox(
                    height: h * .06,
                  ),
                  Custombutton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    title: "Start",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
