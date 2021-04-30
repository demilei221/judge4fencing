import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'video_items.dart';
import 'AIResult.dart';

class AIPage extends StatefulWidget {
  AIPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AIPageState createState() => _AIPageState();
}

class _AIPageState extends State<AIPage> {
  bool isVideo = false;
  VideoPlayerController _controller = null;
  PickedFile file;

  final ImagePicker _picker = ImagePicker();

  Future<void> _setVideoController(PickedFile file) async {
    if (file != null && mounted) {
      VideoPlayerController controller;
      print('play video ');
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
        print('network:' + file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
        print('file:' + file.path);
      }
      setState(() {
        isVideo = true;
        _controller = controller;
      });
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    file = await _picker.getVideo(
        source: source, maxDuration: const Duration(seconds: 10));
    await _setVideoController(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _controller != null
          ? Column(
              children: [
                Expanded(
                  flex: 3,
                  child: VideoItems(
                    videoPlayerController: _controller,
                    autoplay: true,
                    looping: false,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top:30, bottom: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => AIResultPage(
                                        title: 'Result',
                                      )));
                        },
                        child: Text('Analize',style: TextStyle(fontSize: 30),)),
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(top: 200, bottom: 200),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    isVideo = true;
                    _onImageButtonPressed(ImageSource.gallery);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.upload_rounded,
                        size: 50.0,
                        semanticLabel: 'Upload Video',
                      ),
                      Text('Upload Video'),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'upload video',
            child: isVideo
                ? FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller = null;
                        isVideo = true;
                      });

                      isVideo = false;
                      _onImageButtonPressed(ImageSource.gallery);
                    },
                    heroTag: 'video0',
                    tooltip: 'Pick Video from gallery',
                    child: const Icon(
                      Icons.upload_rounded,
                      semanticLabel: 'Upload Video',
                    ),
                  )
                : Text(''),
          )
        ],
      ),
    );
  }
}
