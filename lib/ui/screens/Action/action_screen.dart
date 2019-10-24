import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/screens/Action/action_button.dart';


class ActionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.7, -0.4),
            radius: 1.3,
            colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFFF9FFFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: VideoPlayerScreen(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Hero(
          tag: 'navBar',
          child: NavBar(),
        ),
      ),
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      "https://storage.googleapis.com/baloo-media/video/action_complete.mp4",
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return VideoPlayer(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Center(
          child: ActionButton(
            onPressed: () {
              setState(() {
                _controller.play();
                Future.delayed(
                  const Duration(milliseconds: 2000),
                  () {
                    Navigator.pushNamed(context, RoutePaths.Impact);
                  }
                );
              });
            }
          ),
        ),
      ],
    );
  }
}
