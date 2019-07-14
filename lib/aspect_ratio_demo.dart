
import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          height: 200,
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              color: Colors.orange,
            ),
          ),
        ),
      ),
    ));
  }
}

/// 在 Expand 中使用 AspectRatio 需要在外面加 Align
class AspectRatioPage2 extends StatelessWidget {
  const AspectRatioPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.orange,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: Container(
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
