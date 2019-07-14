import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalRefreshPage extends StatefulWidget {
  @override
  _LocalRefreshPageState createState() => _LocalRefreshPageState();
}

class _LocalRefreshPageState extends State<LocalRefreshPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<LocalModel>(
        builder: (context) => LocalModel(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<LocalModel>(
                  builder: (context, model, _) {
                    return ValueListenableProvider.value(
                      value: model.num,
                      child: Text(
                        'I am ${model.num.value}',
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: getRandomColor(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<LocalModel>(
                    builder: (context, model, _) {
                      return FlatButton(
                        color: getRandomColor(),
                        onPressed: model.increment,
                        child: Text('Add Num'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: Consumer<LocalModel>(
            builder: (context, model, _) {
              return FlatButton(
                  color: getRandomColor(),
                  onPressed: model.increment,
                  child: Text('Add Num'));
            },
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }
}

class LocalModel with ChangeNotifier {
  ValueNotifier<int> num = ValueNotifier(10);
  String name = 'Liusilong';

  void increment() {
    num.value += 1;
    notifyListeners();
  }
}
