import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/home/HomeScreen.dart';
import 'package:movie/utils/SlideRoute.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class TrailerScreen extends StatefulWidget {
  final String linkTrailer;

  TrailerScreen(this.linkTrailer);

  @override
  TrailerState createState() => TrailerState(linkTrailer);
}

class TrailerState extends State<TrailerScreen> {
  VideoPlayerController _controller;
  final String linkTrailer;

  TrailerState(this.linkTrailer);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(linkTrailer)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 42, 58),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 30, 42, 58),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.only(left: normalMargin),
              child: Icon(
                Icons.keyboard_backspace,
                color: yellowColor,
              ),
            ),
          ),
          title: Center(
            child: Text(
              'Trailer',
              style: TextStyle(
                color: yellowColor,
              ),
            ),
          ),
        ),
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
