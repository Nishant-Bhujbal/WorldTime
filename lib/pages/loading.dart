// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime wt =
        WorldTime(location: 'Berlin', flag: 'dummy.png', url: '/Europe/Berlin');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:  {
      'location' : wt.location,
      'flag' : wt.flag,
      'time' : wt.time,
      'isDaytime' : wt.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState(); // run the og function which we are inherting
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900] ,
      body: Center(
        child: SpinKitFoldingCube(
        color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
