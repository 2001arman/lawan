// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../lineup_ranked_logic.dart';
import 'dart:math' as math;

import 'widget/arena_item_content_widget.dart';

class RugbyArenaWidget extends StatefulWidget {
  const RugbyArenaWidget({super.key, required this.controller});
  final AnimationController controller;

  @override
  State<RugbyArenaWidget> createState() => _RugbyArenaWidgetState();
}

class _RugbyArenaWidgetState extends State<RugbyArenaWidget>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<LineupRankedLogic>();
  final state = Get.find<LineupRankedLogic>().state;
  final lobbyState = Get.find<LineupRankedLogic>().lobbyState;

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget itemContent({
      required String position,
      required int index,
    }) {
      return ArenaItemContentWidget(index: index, position: position);
    }

    Widget item(
        {double marginBottom = 0,
        double marginTop = 0,
        required String position,
        required int index}) {
      return Expanded(
        flex: 2,
        child: Container(
          height: 68,
          margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
          child: itemContent(
            position: position,
            index: index,
          ),
        ),
      );
    }

    return Stack(
      children: [
        Padding(
          key: state.keyField,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AspectRatio(
            aspectRatio: 363 / 867, // Approximately 0.4186
            child: AnimatedBuilder(
              animation: widget.controller,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,

                  transform: Matrix4.identity()
                    ..rotateZ(
                        widget.controller.value * math.pi) // Rotate 180 degrees
                    ..scale(1.0,
                        -1.0), // Flip vertically to complete the perspective swap
                  child: child,
                );
              },
              child: SvgPicture.asset(
                'assets/arena/rugby_arena.svg',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),

        // player
        AspectRatio(
          aspectRatio: 363 / 867, // Approximately 0.4186
          child: LayoutBuilder(
            builder: (context, constraints) {
              final halfHeight =
                  (state.keyField.currentContext!.height / 2) + 14;
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: halfHeight,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'GK',
                              index: 0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(flex: 2),
                          item(
                            marginBottom: 0,
                            position: 'DF',
                            index: 2,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginBottom: 22,
                            position: 'DF',
                            index: 3,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginBottom: 44,
                            position: 'DF',
                            index: 4,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          item(
                            position: 'MF',
                            index: 5,
                            marginBottom: 22,
                          ),
                          const SizedBox(width: 12),
                          item(
                            position: 'MF',
                            index: 6,
                          ),
                          const SizedBox(width: 12),
                          item(
                            position: 'MF',
                            index: 7,
                            marginBottom: 22,
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'FW',
                              index: 9,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
