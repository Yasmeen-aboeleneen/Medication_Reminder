// import 'package:flutter/material.dart';
//  import 'package:sizer/sizer.dart';

  

// class DeleteButton extends StatelessWidget {
//   const DeleteButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 18.w, left: 18.w),
//       child: SizedBox(
//         height: 7.h,
//         child: TextButton(
//           onPressed: () {
//             // open alert dialog box
//             openAlertBox(context);
//           },
//           child: Center(
//             child: Text(
//               'Delete',
//               style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
//             ),
//           ),
//           style: TextButton.styleFrom(shape: const StadiumBorder()),
//         ),
//       ),
//     );
//   }

//   openAlertBox(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(35),
//                     bottomRight: Radius.circular(35))),
//             contentPadding: EdgeInsets.only(top: 2.h),
//             title: Text(
//               "Delete This Reminder?",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     'Cancel',
//                     style: TextStyle(fontSize: 16.sp),
//                   )),
//               TextButton(
//                   onPressed: () {
//                     //global block to delete info
//                   },
//                   child: Text(
//                     'Ok',
//                     style: TextStyle(fontSize: 16.sp),
//                   ))
//             ],
//           );
//         });
//   }
// }
