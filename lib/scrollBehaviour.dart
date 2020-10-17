import 'package:flutter/material.dart';

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    // return super.buildViewportChrome(context, child, axisDirection);
    return child;
  }
}
