// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/util/custom_dialog_success.dart';

import '../../../../../utility/shared/constants/action_type.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/shared/widgets/text/text_border.dart';
import 'controller/chat_state.dart';

class ChatUi extends StatelessWidget {
  final state = ChatState();
  ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget containerItem(
        {required VoidCallback onTap,
        required String name,
        required String icon}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: kWhiteColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 4),
              Text(
                name,
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    Widget listChatSection() {
      return ListView.builder(
        padding: EdgeInsets.only(top: defaultMargin),
        itemCount: state.listChat.length,
        itemBuilder: (context, index) {
          ChatModel chatModel = state.listChat[index];
          return Column(
            crossAxisAlignment: chatModel.isMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !chatModel.isMe,
                child: Row(
                  children: [
                    Image.asset(
                      chatModel.avatarImage,
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatModel.name,
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                        const SizedBox(height: 2),
                        TextBorder(
                          textTitle: 'Novice',
                          backgroundColor: kWhiteColor,
                          paddingVertical: 2,
                          paddingHorizontal: 8,
                          fontSize: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ...chatModel.listChatData.map(
                (data) => Column(
                  crossAxisAlignment: chatModel.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: chatModel.isMe ? kBlackColor : kWhiteColor,
                      ),
                      child: Text(
                        data.chatText,
                        style: darkGreyTextStyle.copyWith(
                            fontSize: 12,
                            color:
                                chatModel.isMe ? kWhiteColor : kDarkgreyColor),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.time,
                      style: darkGreyTextStyle.copyWith(fontSize: 10),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Visibility(
              visible: state.listChat.isNotEmpty,
              replacement: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/chat.svg',
                    color: kWhiteColor,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome to the lobby!',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start the conversation or wait for others to join.',
                    style: blackTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              child: listChatSection(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.actionItemList
                  .map(
                    (data) => containerItem(
                      // onTap: () => CustomDialogSuccess.confirmDialog(
                      //   actionType: data.actionType,
                      //   onAction: () {},
                      // ),
                      onTap: () => data.actionType == ActionType.reschedule
                          ? CustomDialogSuccess.rescheduleDialog(
                              onSubmit: () => CustomDialogSuccess.confirmDialog(
                                actionType: data.actionType,
                                onAction: Get.back,
                              ),
                            )
                          : CustomDialogSuccess.confirmDialog(
                              actionType: data.actionType,
                              onAction: Get.back,
                            ),
                      name: data.name,
                      icon: data.icon,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: defaultMargin),
          Row(
            children: [
              CircleButtonWidget(
                onTap: () {},
                isActive: false,
                size: 48,
                widget: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/paperclip.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Write message',
                  controller: TextEditingController(),
                  margin: 0,
                  suffix: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/smile.svg'),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CircleButtonWidget(
                onTap: () {},
                isActive: true,
                size: 48,
                widget: Center(
                  child: Icon(
                    Icons.send_outlined,
                    color: kWhiteColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
