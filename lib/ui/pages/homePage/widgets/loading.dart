import '../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFadingCircle(
          color: kPrimaryColor,
          size: 70,
          duration: const Duration(milliseconds: 2200),
        ),
      ),
    );
  }
}