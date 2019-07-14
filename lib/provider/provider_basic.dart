import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class ProviderBasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Person>.value(
      value: Person('JACK'),
      child: MaterialApp(
        home: Example(),
      ),
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider example'),
      ),
      body: Center(
        child: Text(Provider.of<Person>(context).name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Person>(context).name = "rose";
        },
        child: Icon(Icons.track_changes),
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);
}
