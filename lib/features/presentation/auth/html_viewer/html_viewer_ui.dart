import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_black_gradient.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class HtmlViewerUi extends StatelessWidget {
  final String title;
  final String html;
  const HtmlViewerUi({super.key, required this.title, required this.html});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top,
              defaultMargin,
              0,
            ),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Privacy and security',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding: const EdgeInsets.only(top: 0, bottom: 50),
                        children: [
                          Html(
                            data: html,
                            style: {
                              'h1': Style(
                                fontSize: FontSize(14),
                                fontWeight: medium,
                                margin: Margins.only(top: 12),
                              ),
                              'p': Style(
                                fontSize: FontSize(12),
                                color: kDarkgreyColor,
                                margin: Margins.only(bottom: 0),
                              ),
                              'ul': Style(
                                fontSize: FontSize(12),
                                color: kDarkgreyColor,
                                margin: Margins.only(bottom: 0),
                                padding: HtmlPaddings.only(left: 10),
                              ),
                              'li': Style(
                                fontSize: FontSize(12),
                                color: kDarkgreyColor,
                                margin: Margins.only(bottom: 0),
                                padding: HtmlPaddings.zero,
                              ),
                            },
                          )
                        ],
                      ),
                      const HorizontalWhiteGradient(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: HorizontalBlackGradient(),
          ),
        ],
      ),
    );
  }
}
