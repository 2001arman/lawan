import 'package:flutter/material.dart';
import 'package:lawan/features/presentation/profile/widgets/session_item_widget.dart';

class SessionSection extends StatelessWidget {
  const SessionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SessionItemWidget(),
        SessionItemWidget(),
        SessionItemWidget(),
        SizedBox(height: 100),
      ],
    );
  }
}
