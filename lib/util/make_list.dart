import 'package:flutter/material.dart';

List dy = [0, 0, 1, -1, 1, 1, -1, -1];
List dx = [1, -1, 0, 0, 1, -1, 1, -1];

List<BoxShadow> fourDirectionBoxShadow(double d, Color? color, bool diagonal) {
  return [
    for (var i = (diagonal ? 4 : 0); i < (diagonal ? 8 : 4); i++)
      BoxShadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<BoxShadow> eightDirectionBoxShadow(double d, Color? color) {
  return [
    for (var i = 0; i < 8; i++)
      BoxShadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<Shadow> fourDirectionShadow(double d, Color? color, bool diagonal) {
  return [
    for (var i = (diagonal ? 4 : 0); i < (diagonal ? 8 : 4); i++)
      Shadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<Shadow> eightDirectionShadow(double d, Color? color) {
  return [
    for (var i = 0; i < 8; i++)
      Shadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}
