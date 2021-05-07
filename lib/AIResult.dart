import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'video_items.dart';
import 'Rules.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'dart:convert' as convert;

class AIResultPage extends StatefulWidget {
  AIResultPage({Key key, this.title, this.videoFile}) : super(key: key);
  PickedFile videoFile;
  final String title;

  @override
  _AIResultPageState createState() => _AIResultPageState();
}

class _AIResultPageState extends State<AIResultPage> {
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollVideoController = ScrollController();
  Map rule = Rules.rule1;

  @override
  void initState() {
    super.initState();
    uploadFileToServer();
  }

  void uploadFileToServer() async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('http://428270503f39.ngrok.io/uploader'));

    request.files.add(
      await http.MultipartFile.fromPath(
        'video',
        widget.videoFile.path,
        contentType: MediaType('application', 'mp4'),
      ),
    );

    http.StreamedResponse r = await request.send();
    print(r.statusCode);
    print(await r.stream.transform(utf8.decoder).join());
  }

  getRule(String technique) {
    if (technique == Rules.rule1['technique'])
      rule = Rules.rule1;
    else if (technique == Rules.rule2['technique']) rule = Rules.rule2;
    if (technique == Rules.rule3['technique']) rule = Rules.rule3;
  }

  play_video(url) {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    return VideoItems(
      videoPlayerController: VideoPlayerController.network(url),
      looping: false,
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // child:
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Card(
                    child: ListTile(
                  title: Text(
                    'Technique: ' + rule['technique'],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('\nDescription: ' + rule['description'],
                      style: TextStyle(fontSize: 20)),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollVideoController,
                    child: ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      controller: _scrollVideoController,

                      // padding: const EdgeInsets.all(8),
                      itemCount: rule['video'].length,
                      itemBuilder: (BuildContext context, int index) {
                        print(index);
                        return play_video(rule['video'][index]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
