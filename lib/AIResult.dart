import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_items.dart';
import 'Rules.dart';

class AIResultPage extends StatefulWidget {
  AIResultPage({Key key, this.title, this.videoFile}) : super(key: key);
  final videoFile;
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
