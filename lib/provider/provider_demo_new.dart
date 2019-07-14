import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends ChangeNotifier {
  String name;
  int age;
  User(this.name, this.age);
}

class ProviderDemoNewPage extends StatelessWidget {
  const ProviderDemoNewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<User>(
      builder: (context) => User('Liusilong', 23),
      child: Consumer<User>(
        builder: (context, user, _) {
          return Scaffold(
            body: ProviderHomePage(),
          );
        },
      ),
    );
  }
}

class ProviderHomePage extends StatefulWidget {
  ProviderHomePage({Key key}) : super(key: key);

  _ProviderHomePageState createState() => _ProviderHomePageState();
}

class _ProviderHomePageState extends State<ProviderHomePage> {
  User user;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = Provider.of<User>(context);
    print('user.name = ${user.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${user.name} : ${user.age}'),
      ),
    );
  }
}
