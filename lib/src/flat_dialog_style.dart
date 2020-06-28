import 'package:flutter/material.dart';

enum AnimationStyle { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

class AlertStyle {
  final AnimationStyle animationStyle;
  final Duration animationDuration;
  final ShapeBorder alertBorder;
  final bool closeButtonVisible;
  final bool isTapDismiss;
  final Color backgroundColor;
  final Color overlayColor;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final EdgeInsets buttonAreaPadding;
  final BoxConstraints boxConstraints;

  const AlertStyle({
    this.animationStyle = AnimationStyle.fromLeft,
    this.alertBorder,
    this.animationDuration = const Duration(milliseconds: 150),
    this.backgroundColor = Colors.white,
    this.overlayColor = Colors.black12,
    this.titleStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    ),
    this.descStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    this.buttonAreaPadding = const EdgeInsets.all(20.0),
    this.closeButtonVisible = true,
    this.isTapDismiss = true,
    this.boxConstraints,
  });
}
