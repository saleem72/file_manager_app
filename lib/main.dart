import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dirPath = '';
  bool temp = false;
  void _listFiles() async {
    final directory = await getApplicationDocumentsDirectory();

    print('Main Dir: ${directory.path}');

    final file = (directory.path.split('/'));
    file.removeLast();
    file.removeLast();
    final bbb = file.join('/');
    // ws.xsoh.Qamusee
    print('FFFF: ${bbb}');
    var dir = Directory(bbb);
    List contents = dir.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        print('File: ${fileOrDir.path.split('/').last}');
      } else if (fileOrDir is Directory) {
        print('Dir: ${fileOrDir.path}');
      }

      // update done
    }

    setState(() {
      dirPath = directory.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              dirPath,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _listFiles,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
