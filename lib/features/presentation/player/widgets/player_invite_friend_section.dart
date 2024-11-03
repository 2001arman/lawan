// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../utility/shared/widgets/container/select_friend_item.dart';
import '../../../domain/session/avatar_model.dart';

class PlayerInviteFriendSection extends StatelessWidget {
  const PlayerInviteFriendSection(
      {super.key,
      required this.listFriends,
      required this.onRemoveFriend,
      required this.onAddFriend});
  final RxList<AvatarModel> listFriends;
  final Function(AvatarModel data) onRemoveFriend, onAddFriend;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: listFriends.isNotEmpty,
        replacement: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: CustomButton(
            isBlack: false,
            onTap: () {},
            borderColor: kGreyColor,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/add_user.svg',
                  color: kDarkgreyColor,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Find Friends',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: defaultMargin),
                ...listFriends.map(
                  (data) => SelectFriendItem(
                    name: data.name,
                    asset: data.asset,
                    suffixWidget: data.isSelected.value
                        ? CircleButtonWidget(
                            onTap: () => onRemoveFriend(data),
                            isActive: true,
                            widget: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/check.svg',
                              ),
                            ),
                            size: 36,
                          )
                        : CircleButtonTransparentWidget(
                            onTap: () => onAddFriend(data),
                            size: 36,
                            widget: SvgPicture.asset(
                              'assets/icons/plus.svg',
                              color: kDarkgreyColor,
                            ),
                            borderColor: kGreyColor,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
