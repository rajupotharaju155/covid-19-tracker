import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Center(
        child: SpinKitRing(
          lineWidth: 2,
        color: Colors.blueAccent,
        size: 40.0
      )
      )
    );
  }
}

class PulseLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitRipple(
        color: Colors.red,
        size: 25.0
      )
      )
    );
  }
}


class TextLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFadingCircle(
        color: Colors.grey,
        size: 25.0
      )
      )
    );
  }
}


class RingLoading extends StatelessWidget {
  RingLoading({this.size});
  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: SpinKitRing(
          lineWidth: 2,
        color: Colors.blueAccent,
        size: 38
      )
      )
    );
  }
}