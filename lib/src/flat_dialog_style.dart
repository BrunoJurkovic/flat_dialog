import 'package:flutter/material.dart';

enum AnimationStyle { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

class AlertStyle {
  final AnimationStyle animationStyle;
  final Duration animationDuration;
  final ShapeBorder alertBorder;
  final bool closeButtonVisible;
  final bool isTapDismiss;
  final bool isDescScrollable;
  final Color backgroundColor;
  final Color overlayColor;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final EdgeInsets buttonAreaPadding;
  final BoxConstraints boxConstraints;
  final double descHeight;

  const AlertStyle({
    this.animationStyle = AnimationStyle.fromLeft,
    this.alertBorder,
    this.isDescScrollable = false,
    this.descHeight,
    this.animationDuration = const Duration(milliseconds: 150),
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 50),
    this.overlayColor = Colors.black26,
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
