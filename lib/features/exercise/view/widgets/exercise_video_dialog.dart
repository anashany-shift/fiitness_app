import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseVideoDialog extends StatefulWidget {
  final String youtubeLink;

  const ExerciseVideoDialog({super.key, required this.youtubeLink});

  @override
  State<ExerciseVideoDialog> createState() => _ExerciseVideoDialogState();
}

class _ExerciseVideoDialogState extends State<ExerciseVideoDialog> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeLink);

    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true, 
        mute: false,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: true,
        enableCaption: false,
        
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, 
      insetPadding: const EdgeInsets.all(10), 
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff242424),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.deepOrange,
                
                progressColors: const ProgressBarColors(
                  playedColor: Colors.deepOrange,
                  handleColor: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}