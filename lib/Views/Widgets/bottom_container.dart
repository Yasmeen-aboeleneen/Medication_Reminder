import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Views/Details/details_screen.dart';
import 'package:medication_reminder/Views/Widgets/medicine_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer>
    with SingleTickerProviderStateMixin {
  double opacity = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return StreamBuilder(
        stream: globalBloc.medicineList$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else if (snapshot.data!.isEmpty) {
            return AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Text(
                  'No Medicine yet',
                  style: GoogleFonts.aBeeZee(
                    fontSize: w * .08,
                    fontWeight: FontWeight.bold,
                    color: kDGrey,
                  ),
                ),
              ),
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: Colors.grey,
                  highlightColor: kveryWhite,
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder<void>(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return AnimatedBuilder(
                            animation: animation,
                            builder: (context, Widget? child) {
                              return Opacity(
                                opacity: animation.value,
                                child: MedicineDetailsScreen(
                                    snapshot.data![index]),
                              );
                            },
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500)));
                  },
                  child: MedicineCard(medicine: snapshot.data![index]),
                );
              },
            );
          }
        });
  }
}
