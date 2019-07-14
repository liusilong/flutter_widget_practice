import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String videoUrl;
  VideoPage(this.videoUrl, {Key key}) : super(key: key);

  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;
  VideoPlayer videoPlayer;
  Duration start;
  Duration end;

  void _controllerListener() async {
    Duration curDuration = _controller.value.position;
    if (start == null || end == null) return;
    print(
        'current duration is ${curDuration.inMilliseconds}; ${end.inMilliseconds}');
    if (curDuration.inMilliseconds >= end.inMilliseconds) {
      _controller.seekTo(start).then((_) {
        _controller.play();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initVideoPlayer(widget.videoUrl);
    //https://1254467417.vod2.myqcloud.com/2f4e0c50vodtransgzp1254467417/e27029ba5285890790483308598/v.f32849.m3u8
  }

  /// 初始化完成之后的操作，这里有两种情况
  /// 1. 直接从关卡页面进入的：
  ///     此时直接播放完整的视频
  /// 2. 从结果页面跳转来的：
  ///     此时播放第一段视频
  ///
  initVideoPlayer(String url) {
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // 初始化完毕
        videoPlayer = VideoPlayer(_controller);
        _controller.addListener(_controllerListener);
        _controller.play();
        setState(() {});
      });
  }

  void playRange(Duration start, Duration end) {
    this.start = start;
    this.end = end;
    _controller.removeListener(_controllerListener);
    _controller.addListener(_controllerListener);
    _controller.seekTo(start).then((_) {
      _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: videoPlayer,
                    )
                  : Container(),
            ),
            RaisedButton(
              onPressed: () {
                _controller.seekTo(Duration(seconds: 0)).then((_) {
                  _controller.play();
                });
              },
              child: Text('to 0 '),
            ),
            RaisedButton(
              onPressed: () {
                _controller.seekTo(Duration(seconds: 10)).then((_) {
                  _controller.play();
                });
              },
              child: Text(' to 10'),
            ),
            RaisedButton(
              onPressed: () {
                _controller.seekTo(Duration(seconds: 15)).then((_) {
                  _controller.play();
                });
              },
              child: Text(' to 15'),
            ),
            RaisedButton(
              onPressed: () {
                playRange(Duration(seconds: 3), Duration(seconds: 13));
              },
              child: Text('3 - 13'),
            ),
            RaisedButton(
              onPressed: () {
                playRange(Duration(seconds: 13), Duration(seconds: 20));
              },
              child: Text('13 - 20'),
            ),
            RaisedButton(
              onPressed: () {
                _controller.pause();
              },
              child: Text('Pause'),
            ),
            RaisedButton(
              onPressed: () {
                _controller.play();
              },
              child: Text('Play'),
            )
          ],
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
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
