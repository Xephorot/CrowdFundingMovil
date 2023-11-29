import 'dart:async';
import 'package:flutter/material.dart';

class LoginImage extends StatefulWidget {
  @override
  _LoginImageState createState() => _LoginImageState();
}

class _LoginImageState extends State<LoginImage> {
  final List<String> _images = [
    'https://images.unsplash.com/photo-1558022103-603c34ab10ce?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1425913397330-cf8af2ff40a1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1476231682828-37e571bc172f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: Image.network(_images[_currentIndex], fit: BoxFit.cover),
    );
  }
}
