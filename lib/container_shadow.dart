import 'package:flutter/material.dart';

class ContainerShadow extends StatefulWidget {
  @override
  _ContainerShadowState createState() => _ContainerShadowState();
}

class _ContainerShadowState extends State<ContainerShadow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildShadowContainer(),
    );
  }
}

_buildShadowContainer() {
  return new Container(
      height: 150.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 0.0, // has the effect of extending the shadow
            offset: Offset(
              10.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.circular(8.0),
//  gradient: new LinearGradient(...),
//  child: new Row(...),
      ));
}

List<Widget> _buildChildren() {
  List<Widget> list = [];
  var button = RaisedButton(
    onPressed: () {
      print('button is taped...');
    },
    child: Text('Button'),
  );
  var container = Container(
    width: 500,
    height: 200,
    color: Colors.orange,
  );

  list.add(button);
  list.add(container);
  return list;
}

class SquareCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('some card'),
      ),
    );
  }
}
