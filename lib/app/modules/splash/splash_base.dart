import 'dart:async';

import 'package:flutter/material.dart';


abstract class BaseSplash extends StatefulWidget {
  const BaseSplash({super.key, required this.duration});

  final Duration duration;

  Future<void> onCompleted();

  Widget buidBody();

  @override
  State<BaseSplash> createState() => BaseSplashState();
}

class BaseSplashState extends State<BaseSplash> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Timer(widget.duration, widget.onCompleted));
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: widget.buidBody());
}
