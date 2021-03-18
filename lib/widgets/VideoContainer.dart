import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Home.dart';


class VideoContainer extends StatefulWidget {
  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {

  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;
  double _volume = 0;
  IconData _icon = Icons.volume_off_rounded;
  bool _started = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("files/twentyone_dating_intro.mp4");
    _controller.addListener(() {
      final bool isPlaying = _controller.value.isPlaying;
      if(!_started && isPlaying){
        _started = true;
      } else if (!isPlaying && _started){
        Navigator.of(context).pop();
      }
    });
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller.setVolume(_volume);
          _controller.play();

          return Scaffold(

            body: Stack(
              fit: StackFit.expand,
              children: [
                SizedBox.expand(
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          height: _controller.value.size.height,
                          width: _controller.value.size.width,
                          child: VideoPlayer(_controller),
                        )
                    )
                ),
                Positioned(
                  bottom: 0,
                left:0,
                right:0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.bottomCenter,
                        end: AlignmentDirectional.topCenter,
                        colors: [
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(0)
                        ]
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        IconButton(
                            icon: Icon(_icon, color: Colors.white, size: 36,),
                            onPressed: (){
                              setState(() {
                                _volume = _volume == 0 ? 1 : 0;

                                _icon = _icon == Icons.volume_off_rounded ?
                                    Icons.volume_up_rounded :
                                    Icons.volume_off_rounded;
                              });
                            }
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          );

        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
