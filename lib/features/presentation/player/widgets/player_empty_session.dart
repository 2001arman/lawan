import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/create_session_button.dart';
import '../../../../utility/shared/widgets/video/video_widget.dart';
import '../../../domain/session/avatar_model.dart';

class PlayerEmptySession extends StatelessWidget {
  const PlayerEmptySession(
      {super.key,
      required this.videoPlayerController,
      required this.onTap,
      required this.selectedFriends});
  final VideoPlayerController videoPlayerController;
  final VoidCallback onTap;
  final RxList<AvatarModel> selectedFriends;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: kBlackColor,
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: Get.height,
                // child: VideoWidget(videoController: videoPlayerController),
              ),
              Container(
                width: double.infinity,
                height: Get.height,
                color: kBlackColor.withOpacity(0.6),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/add_avatars.png',
                        width: 60,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'VS',
                        style: whiteTextStyle.copyWith(
                            fontSize: 10, fontWeight: bold),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/icons/add_avatars.png',
                        width: 60,
                      ),
                    ],
                  ),
                  SizedBox(height: defaultMargin),
                  Text(
                    'No session available',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  Text(
                    'Create a session to start playing',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreateSessionButton(
                        onTap: onTap,
                        selectedFriends: selectedFriends,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            gradient: blackGradient,
          ),
        ),
      ],
    );
  }
}
