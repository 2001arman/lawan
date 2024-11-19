// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/widget/arena_item_content_widget.dart';

import '../lineup_ranked_logic.dart';

class MartialArenaWidget extends StatefulWidget {
  const MartialArenaWidget({super.key, required this.controller});
  final AnimationController controller;

  @override
  State<MartialArenaWidget> createState() => _MartialArenaWidgetState();
}

class _MartialArenaWidgetState extends State<MartialArenaWidget>
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
      String? position,
      required int index,
    }) {
      return ArenaItemContentWidget(index: index, position: position);
    }

    return Stack(
      children: [
        Padding(
          key: state.keyField,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset(
            'assets/arena/martial_arena.svg',
            alignment: Alignment.center,
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
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 60),
                      SizedBox(
                        width: 88,
                        height: 68,
                        child: itemContent(
                          index: 0,
                          position: 'HO',
                        ),
                      ),
                      const SizedBox(height: 90),
                      SizedBox(
                        width: 88,
                        height: 68,
                        child: itemContent(
                          index: 1,
                          position: 'AW',
                        ),
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
