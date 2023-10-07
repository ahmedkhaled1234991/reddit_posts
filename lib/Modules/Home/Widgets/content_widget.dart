import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:video_player/video_player.dart';

import '../home_controller.dart';
import 'actions_widget.dart';

class ContentWidget extends StatefulWidget {
  final String? src;

  const ContentWidget({Key? key, this.src}) : super(key: key);

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends StateMVC<ContentWidget> {
  _ContentWidgetState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.src!));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      showControls: true,
      looping: true,
      allowFullScreen: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return con.commentsClosed
        ? Stack(
            fit: StackFit.expand,
            children: [
              _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Positioned.fill(
                      top: 17,
                      child: Chewie(
                        controller: _chewieController!,
                      ),
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
              Positioned(
                top: 18,
                left: 4,
                right: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Post title',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const Positioned(
                bottom: 55,
                left: 0,
                right: 0,
                child: ActionsWidget(),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 280,
                child: Chewie(
                  controller: _chewieController!,
                ),
              ),
            ],
          );
  }
}
