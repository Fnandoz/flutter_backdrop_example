
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BackdropTestApp());
}
Widget _widget1() {
  return Center(
    child: Text("Widget 1"),
  );
}

Widget _widget2() {
  return Center(
    child: Text("Widget 2"),
  );
}

final List<Widget> _widgets = [_widget1(), _widget2()];
int _currentIndex = 0;

Widget _body(_BackdropTestApp parent) {
  return BackdropScaffold(
    appBar: BackdropAppBar(
      title: Text("Backdrop Example"),
    ),
    stickyFrontLayer: true,
    frontLayer: _widgets[_currentIndex],
    backLayer: BackdropNavigationBackLayer(
      items: [
        ListTile(title: Text("Widget 1")),
        ListTile(title: Text("Widget 2")),
      ],
      onTap: (int position) => { parent.setState(() {
        _currentIndex = position;
      }) },
    ),
  );
}
class BackdropTestApp extends StatefulWidget {
  _BackdropTestApp createState() => _BackdropTestApp();
}

class _BackdropTestApp extends State<BackdropTestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Backdrop Test",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _body(this),
      ),
    );
  }
}