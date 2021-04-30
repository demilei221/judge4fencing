import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'RuleDescriptionScreen.dart';
import 'Rules.dart';

class LearnPage extends StatefulWidget {
  LearnPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  final List<String> entries = <String>['Rule 1', 'Rule 2', 'Rule 3'];
  final List rules = [Rules.rule1, Rules.rule2, Rules.rule3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),

          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[300], // background
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => RuleDescriptionPage(
                                    title: entries[index],
                                    rule: rules[index],
                                  )));
                    },
                    child: Text(' ${entries[index]}')),
              ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
