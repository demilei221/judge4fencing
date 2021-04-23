import 'package:flutter/material.dart';
import 'package:judge4fencing/AIPage.dart';
import 'package:judge4fencing/LearnScreen.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  RoutePageState createState() => RoutePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions;

  void initState() {
    _widgetOptions = <Widget>[
      LearnPage(
        title: 'Learn',
      ),
      AIPage(title: 'AI judge')
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
//            title: Text('Current'),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.addchart_rounded),
//            title: Text(
//              'History',
//            ),
            label: 'AI Judge',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
