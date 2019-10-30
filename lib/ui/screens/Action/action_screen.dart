import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';
import 'package:baloo/ui/screens/Action/action_button.dart';
import 'package:baloo/ui/components/base_data_widget.dart';

// Models
import 'package:baloo/core/viewmodels/nav_bar_model.dart';
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/viewmodels/impact_model.dart';
import 'package:baloo/core/models/action_data.dart';


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
  bool showPressAndHold = false;
  bool pressed = false;

  // TODO mjf: get this action from an action button model
  ImpactAction action = new ImpactAction(
    [
      new ActionData(
        'water',
        627.81,
      ),
      new ActionData(
        'co2',
        0.63,
      ),
    ],
    true,
    'I ate a plant-based meal',
  );

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      "https://storage.googleapis.com/baloo-media/video/action_complete.mp4",
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    Timer(
      Duration(milliseconds: 2500),
      () {
        if (!pressed) {
          showPressAndHold = true;
          setState(() => {});
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavBarModel>(context);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                opacity: showPressAndHold ? 1.0 : 0.0,
                duration: Duration(milliseconds: 750),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 56.0),
                  child: Text(
                    'Press and hold to complete',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF979797),
                    ),
                  ),
                ),
              ),
              BaseDataWidget<ImpactModel>(
                model: ImpactModel(api: Provider.of(context)),
                onModelReady: (model) => { /* TODO mjf: fetch data */ },
                builder: (context, impact, child) =>
                  ActionButton(
                    onPressed: () {
                      pressed = true;

                      setState(() {
                        _controller.play();
                        Future.delayed(
                          const Duration(milliseconds: 2000),
                          () {
                            impact.completeActions([action]);
                            nav.updateRoute(RoutePaths.Impact);
                            Navigator.pushNamed(context, RoutePaths.Impact);
                          }
                        );
                      });
                    },
                    message: action.message,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
