import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animation = true;
          setState(() {});
        },
        backgroundColor: Colors.amber,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: this.animation,
          from: 70,
          duration: Duration(milliseconds: 1000),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
