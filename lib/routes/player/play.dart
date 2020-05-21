/*
 * @Author: your name
 * @Date: 2020-05-06 14:51:13
 * @LastEditTime: 2020-05-15 16:09:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \videos\lib\routes\player\play.dart
 */
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class VideoApp extends StatefulWidget {
  VideoApp({
    Key key,
    @required this.playurl,  // 接收一个text参数
  }) : super(key: key);
  final String playurl;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  
  VideoPlayerController _controller;
 ChewieController chewieController;
  @override
  void initState() {
    
    super.initState();
    print(widget.playurl);
    _controller = VideoPlayerController.network(
        widget.playurl);
    chewieController = ChewieController(
      videoPlayerController: _controller,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.black,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      aspectRatio: 3 / 2, //宽高比
      autoPlay: true, //自动播放
      looping: false, //循环播放
    );

      // ..initialize().then((_) {
      //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      //   setState(() {});
      // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: new Center(
        child: Chewie(
          controller: chewieController,
        ),
    ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
       /**
     * 当页面销毁的时候，将视频播放器也销毁
     * 否则，当页面销毁后会继续播放视频！
     */
    _controller.dispose();
    chewieController.dispose();
    // super.dispose();
  }
}