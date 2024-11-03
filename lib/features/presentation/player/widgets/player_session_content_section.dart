import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/fields/field_session_widget.dart';
import '../../../domain/session/session_model.dart';

class PlayerSessionContentSection extends StatelessWidget {
  const PlayerSessionContentSection(
      {super.key,
      required this.emptySessionWidget,
      required this.showDetailSession,
      required this.sessionList});
  final Widget emptySessionWidget;
  final Function(SessionModel data) showDetailSession;
  final RxList<SessionModel> sessionList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Stack(
          children: [
            Visibility(
              visible: sessionList.isNotEmpty,
              replacement: emptySessionWidget,
              child: ListView(
                padding: EdgeInsets.all(defaultMargin),
                children: [
                  ...sessionList.asMap().entries.map(
                        (data) => GestureDetector(
                          onTap: () => showDetailSession(data.value),
                          child: FieldSessionWidget(
                            sessionModel: data.value,
                            showGameInformation: data.key == 0 || data.key == 1,
                          ),
                        ),
                      ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
            Visibility(
              visible: sessionList.isNotEmpty,
              child: Container(
                width: double.infinity,
                height: 16,
                decoration: BoxDecoration(
                  gradient: whiteGradient,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
