import 'package:flutter/material.dart';

List dy = [0, 0, 1, -1, 1, 1, -1, -1];
List dx = [1, -1, 0, 0, 1, -1, 1, -1];

List<BoxShadow> fourDirectionBoxShadow(
    {required double d, Color? color, bool? diagonal}) {
  return [
    for (var i = (diagonal ?? false ? 4 : 0);
        i < (diagonal ?? false ? 8 : 4);
        i++)
      BoxShadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<BoxShadow> eightDirectionBoxShadow({required double d, Color? color}) {
  return [
    for (var i = 0; i < 8; i++)
      BoxShadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<Shadow> fourDirectionShadow(
    {required double d, Color? color, bool? diagonal}) {
  return [
    for (var i = (diagonal ?? false ? 4 : 0);
        i < (diagonal ?? false ? 8 : 4);
        i++)
      Shadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<Shadow> eightDirectionShadow({required double d, Color? color}) {
  return [
    for (var i = 0; i < 8; i++)
      Shadow(
        offset: Offset(dy[i] * d, dx[i] * d),
        color: color ?? Colors.transparent,
      )
  ];
}

List<Shadow> customDirectionShadow(
    {required String direction, required double d, Color? color}) {
  return switch (direction) {
    'top_left' => [
        Shadow(
          offset: Offset(-d, -d),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(-d, 0),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(0, -d),
          color: color ?? Colors.transparent,
        )
      ],
    'top_right' => [
        Shadow(
          offset: Offset(d, -d),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(d, 0),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(0, -d),
          color: color ?? Colors.transparent,
        )
      ],
    'bottom_left' => [
        Shadow(
          offset: Offset(-d, d),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(-d, 0),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(0, d),
          color: color ?? Colors.transparent,
        )
      ],
    'bottom_right' => [
        Shadow(
          offset: Offset(d, d),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(d, 0),
          color: color ?? Colors.transparent,
        ),
        Shadow(
          offset: Offset(0, d),
          color: color ?? Colors.transparent,
        )
      ],
    _ => [],
  };
}
