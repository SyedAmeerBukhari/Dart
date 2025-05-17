import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Parallax Effect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          setState(() {}); // Update the UI on scroll
          return true;
        },
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        _controller.hasClients ? -_controller.offset * 0.3 : 0,
                      ),
                      child: Image.network(
                        'https://picsum.photos/800/400',
                        fit: BoxFit.cover,
                        height: 300, // Set a height to make it visible
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: const Text(
                      'Parallax Background',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 1000,
                color: Colors.grey[200],
                child: const Center(
                  child: Text(
                    'Scroll down to see the parallax effect',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
