import 'package:flutter/material.dart';

class RuleDescriptionPage extends StatefulWidget {
  RuleDescriptionPage({Key key, this.title, this.rule}) : super(key: key);
  final rule;
  final String title;

  @override
  _RuleDescriptionPageState createState() => _RuleDescriptionPageState();
}

class _RuleDescriptionPageState extends State<RuleDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
                child: ListTile(
              title: Text('Technique: ' + widget.rule['technique'],style: TextStyle(fontSize: 20) ,),

              subtitle: Text('\nDescription: ' + widget.rule['description'],style:TextStyle(fontSize: 20)),
            )),
          ],
        ),
      ),
    );
  }
}
