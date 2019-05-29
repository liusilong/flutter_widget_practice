import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('showAlertDialog'),
                onPressed: () {
                  _showDialog();
                }),
            RaisedButton(
                child: Text('showCustomDialog'),
                onPressed: () {
                  _showCustomDialog();
                })
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        barrierDismissible: false, // 点击外部区域不会让dialog关闭
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert dialog title'),
            content: Text('Alert Dialog body'),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showCustomDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog();
        });
  }
}

class CustomDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 250,
          width: 350,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // 内容卡片
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  width: 350,
                  height: 200,
                ),
              ),
              // 圆形图像
              Positioned(
                top: 0,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                top: 116,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Liusilong',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Though flutter is incredibly easy to make UI components, you have to go through a lot of experimental process to get what we want.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25, 16),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      // 套一层这个使得 InkWell 有水墨效果
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.orange,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Okay',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
