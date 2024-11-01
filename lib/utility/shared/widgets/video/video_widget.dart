import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoController;
  const VideoWidget({super.key, required this.videoController});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  void initState() {
    super.initState();
    widget.videoController.initialize().then((_) {
      widget.videoController.play();
      widget.videoController.setLooping(true);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoController.value.isInitialized) {
      return FittedBox(
        fit: BoxFit
            .fitHeight, // Fill the container while maintaining the aspect ratio
        child: SizedBox(
          width: widget.videoController.value.size.width,
          height: widget.videoController.value.size.height,
          child: VideoPlayer(widget.videoController),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
