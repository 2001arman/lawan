import 'package:flutter/cupertino.dart';

import '../../constants/constants_ui.dart';

class SelectableTextField extends StatelessWidget {
  final Widget suffix;
  final Widget data;
  final VoidCallback onTap;
  const SelectableTextField(
      {super.key,
      required this.suffix,
      required this.data,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              suffix,
              const SizedBox(width: 8),
              data,
              const Spacer(),
              Image.asset(
                'assets/icons/arrow_up_down.png',
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
