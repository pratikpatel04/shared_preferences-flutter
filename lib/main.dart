import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyScreen();
  }
}


class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) :super(key: key);
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String myText = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter Demo'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'shared Priference Demo',
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                onPressed: () {
                  _SaveData();
                },
                child: const Text('Save')),
              ElevatedButton(
                onPressed: () {
                  _GetData();
                },
                child: const Text('Get')),
              ElevatedButton(
                onPressed: () {
                  _RemoveData();
                },
                child: const Text('Remove')),
              Text(
                myText,
                style: const TextStyle(fontSize: 25),
              ),
            ]
          ),
        )),
    );
  }

  void _SaveData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 10);
    setState(() {
      myText = "Saved"; 
    });
  }
  void _GetData() async {
    var prefs = await SharedPreferences.getInstance(); 
    final int? counter = prefs.getInt('counter');

    setState(() {
      myText = "Get Data : $counter";
    }); 
  }
  void _RemoveData() async {
    var prefs = await SharedPreferences.getInstance(); 
    await prefs.remove('counter');
    setState(() {
      myText = "Removed"; 
    });
  }
}