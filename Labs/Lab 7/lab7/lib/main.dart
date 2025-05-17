import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2 - Multiple Visibility',
      home: MyHomePage(title: 'Task 2 - Multiple Visibility'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isVisibleText1 = true;
  bool _isVisibleText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // using the passed title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Text Widget and Button
            Visibility(
              visible: _isVisibleText1,
              child: Text(
                'Flutter is awesome!',
                style: TextStyle(fontSize: 22),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isVisibleText1 = !_isVisibleText1;
                });
              },
              child: Text(_isVisibleText1 ? 'Hide Text 1' : 'Show Text 1'),
            ),
            SizedBox(height: 30),

            // Second Text Widget and Button
            Visibility(
              visible: _isVisibleText2,
              child: Text(
                'Learn Flutter',
                style: TextStyle(fontSize: 22),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isVisibleText2 = !_isVisibleText2;
                });
              },
              child: Text(_isVisibleText2 ? 'Hide Text 2' : 'Show Text 2'),
            ),
          ],
        ),
      ),
    );
  }
}
