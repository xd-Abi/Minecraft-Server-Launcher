import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space(this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class HSpace extends StatelessWidget {
  final double space;

  const HSpace(this.space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(space, 0);
}

class VSpace extends StatelessWidget {
  final double space;

  const VSpace(this.space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, space);
}
