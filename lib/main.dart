import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = WebviewController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await _controller.initialize();
    await _controller.loadUrl('https://restaurant.apnathali.com/signin');

    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? Webview(_controller)
          : const Text('Not Initialized'),
    );
  }
}
