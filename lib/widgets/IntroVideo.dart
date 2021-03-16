import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroVideo extends StatefulWidget {
  final String link;
  final bool? sound;

  const IntroVideo({Key? key, required this.link, this.sound}) : super(key: key);

  @override
  _FeedVideoState createState() => _FeedVideoState();
}

class _FeedVideoState extends State<IntroVideo> {
  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    print(widget.link);
    _controller = VideoPlayerController.asset("files/twentyone_dating_intro.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Future.delayed(Duration(milliseconds: 1000)).then((value) {
            if(widget.sound == null || widget.sound == false){
              _controller.setVolume(0.0);
            }
            _controller.setLooping(true);
            _controller.play();
          });

          return SizedBox(
            height: _controller.value.size.height,
            width: _controller.value.size.width,
            child: VideoPlayer(_controller),
          );
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the VideoPlayer.
          return Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 5,
                    sigmaX: 5,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(.75),
                  ),
                ),
              ),
            ],
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
