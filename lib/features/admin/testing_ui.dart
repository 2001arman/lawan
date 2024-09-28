// import 'package:flutter/material.dart';
// import 'package:flutter_portal/flutter_portal.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:lawan/utility/shared/constants/constants_ui.dart';
// import 'package:lawan/utility/shared/widgets/custom_button.dart';
// import 'package:wheel_picker/wheel_picker.dart';



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Portal(
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(title: const Text('Example')),
//           body: LayoutBuilder(
//             builder: (_, __) {
//               return LayoutBuilder(builder: (_, __) {
//                 return const DatePickerUsageExample();
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DatePickerUsageExample extends StatefulWidget {
//   static const String namePath = '/date';
//   const DatePickerUsageExample({Key? key}) : super(key: key);

//   @override
//   _DatePickerUsageExampleState createState() => _DatePickerUsageExampleState();
// }

// class _DatePickerUsageExampleState extends State<DatePickerUsageExample> {
//   DateTime? pickedDate;
//   bool showDatePicker = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DeclarativeDatePicker(
//           visible: showDatePicker,
//           onClose: (date) => setState(() {
//             showDatePicker = false;
//             pickedDate = date;
//           }),
//           onDismissed: () => setState(() => showDatePicker = false),
//           child: pickedDate == null
//               ? ElevatedButton(
//                   onPressed: () => setState(() => showDatePicker = true),
//                   child: const Text('pick a date'),
//                 )
//               : Text('The date picked: $pickedDate'),
//         ),
//       ),
//     );
//   }
// }
