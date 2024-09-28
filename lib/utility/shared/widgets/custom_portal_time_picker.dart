// import 'package:flutter/material.dart';
// import 'package:flutter_portal/flutter_portal.dart';
// import 'package:get/get.dart';
// import 'package:lawan/utility/shared/constants/constants_ui.dart';
// import 'package:lawan/utility/shared/widgets/custom_button.dart';
// import 'package:wheel_picker/wheel_picker.dart';

// class CustomPortalTimePicker extends StatelessWidget {
//   const CustomPortalTimePicker({
//     super.key,
//     required this.visible,
//     required this.onDismissed,
//     required this.onClose,
//     required this.child,
//   });

//   final bool visible;
//   final Widget child;
//   final VoidCallback onDismissed;
//   final void Function(DateTime date) onClose;

//   @override
//   Widget build(BuildContext context) {
//     final hourWheel = WheelPickerController(
//       itemCount: 24,
//     );
//     final minuteWheel = WheelPickerController(
//       itemCount: 60,
//     );
//     TextStyle textStyle = const TextStyle(fontSize: 16, height: 1.5);
//     return PortalTarget(
//       anchor: const Aligned(
//         follower: Alignment.bottomCenter,
//         target: Alignment.topCenter,
//         backup: Aligned(
//           follower: Alignment.bottomCenter,
//           target: Alignment.topCenter,
//           // widthFactor: 1,
//         ),
//       ),
//       visible: visible,
//       portalFollower: Container(
//         width: Get.width * .8,
//         height: 250,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: kWhiteColor,
//           borderRadius: BorderRadius.circular(32),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: WheelPicker(
//                       builder: (context, index) => Text(
//                         index < 10 ? '0$index' : '$index',
//                         style: textStyle,
//                       ),
//                       controller: hourWheel,
//                       selectedIndexColor: Colors.black,
//                       onIndexChanged: (index) {},
//                       style: WheelPickerStyle(
//                         itemExtent: textStyle.fontSize! *
//                             textStyle.height!, // Text height
//                         squeeze: 0.9,
//                         diameterRatio: 1,
//                         surroundingOpacity: .25,
//                         magnification: 1.2,
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'to',
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black),
//                   ),
//                   Expanded(
//                     child: WheelPicker(
//                       builder: (context, index) => Text(
//                         index < 10 ? '0$index' : '$index',
//                         style: textStyle.copyWith(
//                           color: Colors.black,
//                         ),
//                       ),
//                       controller: minuteWheel,
//                       selectedIndexColor: Colors.black,
//                       onIndexChanged: (index) {},
//                       style: WheelPickerStyle(
//                         itemExtent: textStyle.fontSize! *
//                             textStyle.height!, // Text height

//                         squeeze: 0.9,
//                         diameterRatio: 1,
//                         surroundingOpacity: .25,
//                         magnification: 1.2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 CustomButton(
//                   title: 'Cancel',
//                   isBlack: false,
//                   onTap: onDismissed,
//                 ),
//                 CustomButton(
//                   title: 'Save',
//                   isBlack: true,
//                   onTap: () => onClose(DateTime.now()),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       child: child,
//     );
//   }
// }
