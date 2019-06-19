import 'package:flutter/material.dart';

class SpacerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildBox(),
            Spacer(flex: 1,),
            _buildBox(),
            Spacer(flex: 2,),
            _buildBox()
          ],
        ),
      ),
    );
  }

  Widget _buildBox() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }
}
