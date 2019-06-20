import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RouterDemoPage extends StatelessWidget {
  const RouterDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage()
      },
    );
  }
}

_buildText(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/second');

            },
            child: _buildText('Page 1'),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async{
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => ThirdPage()),
              //     ModalRoute.withName('/'));
               Map map =await Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
               if(map['o'] == 0){
                 print('adfafasfasdfasfds...');
                 SystemChrome.setPreferredOrientations(
                     [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
               }
//              Navigator.pushReplacement(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => ThirdPage()));
            },
            child: _buildText('Page 2'),
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop({'o': 0});
            },
            child: _buildText('Page 3'),
          ),
        ),
      ),
    );
  }
}
