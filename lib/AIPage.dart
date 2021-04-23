import 'package:flutter/material.dart';
import 'AIResult.dart';
import 'package:flutter/cupertino.dart';

class AIPage extends StatefulWidget {
  AIPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AIPageState createState() => _AIPageState();
}

class _AIPageState extends State<AIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Upload Video'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AIResultPage(
                                title: 'Result',
                              )));
                },
                child: Text('Analize'))
          ],
        ),
      ),
    );
  }
}
