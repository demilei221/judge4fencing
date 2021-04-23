import 'package:flutter/material.dart';

class AIResultPage extends StatefulWidget {
  AIResultPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AIResultPageState createState() => _AIResultPageState();
}

class _AIResultPageState extends State<AIResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text('Result'),
        ],
      ),
    );
  }
}
