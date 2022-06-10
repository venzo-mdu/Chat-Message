
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  // ignore: non_constant_identifier_names
  void changeText(String text) {
    this.setState(() {
      this.text=text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hello world!')),
        body: Column(children: <Widget>[
          TextInputWidget(this.changeText),
          Text(this.text)
        ]));
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  TextInputWidget(this.callback);
  @override
  // ignore: library_private_types_in_public_api
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // ignore: non_constant_identifier_names
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    // ignore: prefer_typing_uninitialized_variables
    // var controller;
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            controller: this.controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.message),
                labelText: "Type a message:",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  splashColor: Colors.blueGrey,
                  tooltip: "post message",
                  onPressed: this.click,
                )
            )
        )
      ],
    );
  }
}