import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'RuleDescriptionScreen.dart';
import 'Rules.dart';

class LearnPage extends StatefulWidget {
  LearnPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  final List<String> entries = <String>['Rule 1', 'Rule 2', 'Rule 3'];
  final List rules = [Rules.rule1, Rules.rule2,Rules.rule3];

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
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[300],
              child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[300], // background

                    ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => RuleDescriptionPage(
                                      title: entries[index], rule: rules[index],
                                    )));
                      },
                      child: Text(' ${entries[index]}'))),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
