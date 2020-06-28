/*
 * Credit to Ratel for parts of this code.
 */
import 'package:flutter/material.dart';

class FlatDialogButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final Gradient gradient;
  final BorderRadius radius;
  final Function onPressed;

  /// DialogButton constructor
  const FlatDialogButton({
    Key key,
    this.child,
    this.width,
    this.height = 60,
    this.color,
    this.gradient,
    this.radius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.blueAccent.withOpacity(0.8),
        gradient: gradient,
        borderRadius: radius ?? BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {onPressed},
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}