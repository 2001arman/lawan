import 'package:flutter/material.dart';
import 'package:lawan/features/presentation/profile/widgets/session_item_widget.dart';

class SessionSection extends StatelessWidget {
  const SessionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SessionItemWidget(),
        SessionItemWidget(),
        SessionItemWidget(),
        const SizedBox(height: 100),
      ],
    );
  }
}
