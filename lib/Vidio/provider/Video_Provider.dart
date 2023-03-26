import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier
{
  VideoPlayerController?  videoplayer;
  ChewieController? song;
  List Images = [
    "assets/images/devil.jpg",
    "assets/images/dollar.jpg",
    "assets/images/legend.jpg",
    "assets/images/level.jpeg",
    "assets/images/so high.jpg",
  ];

  List videopath = [
    "assets/video/devil.mp4",
    "assets/video/doller.mp4",
    "assets/video/legend.mp4",
    "assets/video/levels.mp4",
    "assets/video/so high.mp4",
  ];
  void videoload(int index)
  {
    videoplayer = VideoPlayerController.asset("${videopath[index]}")..initialize();
    song = ChewieController(videoPlayerController: videoplayer!,autoPlay: false,looping: false,);
  }

  void pausesong()
  {
    song!.pause();
  }
}
