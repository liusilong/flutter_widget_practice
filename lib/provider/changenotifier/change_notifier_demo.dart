import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppState.dart';

class ChangeNotifierDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AppState>(
        builder: (_) => AppState(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Provider.of(context)),
      ),
    );
  }
}
