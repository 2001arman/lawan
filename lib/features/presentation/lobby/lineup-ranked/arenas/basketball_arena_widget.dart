// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/widget/arena_item_content_widget.dart';

import '../lineup_ranked_logic.dart';
import 'dart:math' as math;

class BasketballArenaWidget extends StatefulWidget {
  const BasketballArenaWidget({super.key, required this.controller});
  final AnimationController controller;

  @override
  State<BasketballArenaWidget> createState() => _BasketballArenaWidgetState();
}

class _BasketballArenaWidgetState extends State<BasketballArenaWidget>
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
                'assets/arena/basket_arena.svg',
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'SF',
                              index: 0,
                            ),
                          ),
                          const SizedBox(width: 24),
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'PF',
                              index: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'C',
                              index: 2,
                            ),
                          ),
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'SG',
                              index: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'PG',
                              index: 4,
                            ),
                          ),
                          const Spacer(),
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
