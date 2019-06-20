import 'package:flutter/material.dart';
import 'package:flutter_widget_practice/get_it/locator.dart';
import 'package:flutter_widget_practice/get_it/user.dart';

class GetItHomePage extends StatelessWidget {
  const GetItHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetItFirstPage(),
    );
  }
}

class GetItFirstPage extends StatefulWidget {
  const GetItFirstPage({Key key}) : super(key: key);

  @override
  _GetItFirstPageState createState() => _GetItFirstPageState();
}

class _GetItFirstPageState extends State<GetItFirstPage> {
  User user;
  @override
  void initState() {
    super.initState();
    user = locator<User>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetItSecondPage()));
          },
          child: Text(
            user.name,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FlatButton(
        onPressed: () {
          setState(() {
            user.name = "Liusilong";
            print('user name is ${user.name}');
          });
        },
        child: Text('Change name to Liusilong'),
      ),
    );
  }
}

class GetItSecondPage extends StatefulWidget {
  GetItSecondPage({Key key}) : super(key: key);

  _GetItSecondPageState createState() => _GetItSecondPageState();
}

class _GetItSecondPageState extends State<GetItSecondPage> {
  User user = locator<User>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            user.name,
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        floatingActionButton: FlatButton(
          onPressed: () {
            setState(() {
              user.name = "Machi";
            });
          },
          child: Text('Change Name to Machi'),
        ),
      ),
    );
  }
}
