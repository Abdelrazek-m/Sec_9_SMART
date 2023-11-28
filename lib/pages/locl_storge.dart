import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorgePage extends StatefulWidget {
  const LocalStorgePage({super.key});

  @override
  State<LocalStorgePage> createState() => _LocalStorgePageState();
}

class _LocalStorgePageState extends State<LocalStorgePage> {
  late SharedPreferences prefs;
  String? name;
  int? age;

  defPrefs() async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }

  setPrefs() {
    prefs.setString('name', 'taher');
    prefs.setInt('age', 22);
    print('setPrefs done');
  }

  getPrefs() {
    name = prefs.getString('name');
    age = prefs.getInt('age');
    setState(() {});
  }

  removePrefs() {
    prefs.remove('name');
    prefs.remove('age');

    setState(() {});
  }

  @override
  void initState() {
    defPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: setPrefs, child: Text('set data')),
          TextButton(onPressed: getPrefs, child: Text('get data')),
          TextButton(onPressed: removePrefs, child: Text('remove data')),
          SizedBox(height: 50),
          Text('name: $name, age: $age'),
        ],
      ),
    );
  }
}
