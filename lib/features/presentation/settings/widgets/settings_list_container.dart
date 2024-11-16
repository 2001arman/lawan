// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../settings_state.dart';

class SettingsListContainer extends StatefulWidget {
  final List<SettingItem> listSettings;
  final String title;
  const SettingsListContainer({
    super.key,
    required this.listSettings,
    required this.title,
  });

  @override
  State<SettingsListContainer> createState() => _SettingsListContainerState();
}

class _SettingsListContainerState extends State<SettingsListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultMargin),
      margin: EdgeInsets.only(bottom: defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: darkGreyTextStyle.copyWith(fontWeight: medium),
          ),
          ...widget.listSettings.map(
            (data) => GestureDetector(
              onTap: data.onTap,
              child: Padding(
                padding: EdgeInsets.only(top: defaultMargin),
                child: Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: () {},
                      widget: SvgPicture.asset(
                        data.icon,
                        color: kDarkgreyColor,
                        width: 24,
                        height: 24,
                      ),
                      borderColor: kGreyColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                          if (data.subTitle != null)
                            Text(
                              data.subTitle!,
                              style: darkGreyTextStyle.copyWith(fontSize: 12),
                            )
                        ],
                      ),
                    ),
                    data.valueRadio != null
                        ? SizedBox(
                            height: 32,
                            width: 48,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Transform.scale(
                                scale: 0.9,
                                child: Switch(
                                  value: data.valueRadio!,
                                  onChanged: (active) {
                                    setState(() {
                                      data.valueRadio = active;
                                    });
                                  },
                                  activeColor: kWhiteColor,
                                  activeTrackColor: kGreenColor,
                                  inactiveThumbColor: kDarkgreyColor,
                                  inactiveTrackColor: Colors.transparent,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/icons/chevron-right.svg',
                            width: 24,
                            height: 24,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
