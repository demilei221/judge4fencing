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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
