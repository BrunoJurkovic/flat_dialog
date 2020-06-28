import 'package:flutter/material.dart';

import 'flat_dialog_animations.dart';
import 'flat_dialog_button.dart';
import 'flat_dialog_style.dart';

enum DialogType { error, success, info, warning, none }


class FlatDialog {
  final BuildContext context;
  final DialogType type;
  final AlertStyle style;
  final Image image;
  final String title;
  final String desc;
  final Widget content;
  final List<FlatDialogButton> buttons;
  final Function closeFunction;


  FlatDialog({
    @required this.context,
    this.type,
    this.style = const AlertStyle(),
    this.image,
    @required this.title,
    this.desc,
    this.content,
    this.buttons,
    this.closeFunction,
  });

  /// Displays defined alert window
  Future<bool> show() async {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildDialog();
      },
      barrierDismissible: style.isTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: style.overlayColor,
      transitionDuration: style.animationDuration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

// Will be added in next version.
  // void dismiss() {
  //   Navigator.pop(context);
  // }

  // Alert dialog content widget
  Widget _buildDialog() {
    return Center(
      child: ConstrainedBox(
        constraints: style.boxConstraints ?? const BoxConstraints.expand(width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: style.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
              shape: style.alertBorder ?? _defaultShape(),
              title: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _getCloseButton(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, style.closeButtonVisible ? 0 : 20, 20, 0),
                      child: Column(
                        children: <Widget>[
                          _getImage(),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            title,
                            style: style.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: desc == null ? 5 : 10,
                          ),
                          if (desc == null) Container() else Text(
                                  desc,
                                  style: style.descStyle,
                                  textAlign: TextAlign.center,
                                ),
                          if (content == null) Container() else content,
                        ],
                      ),
                    )
                  ],
                ),
              ),
              contentPadding: style.buttonAreaPadding,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getButtons(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ShapeBorder _defaultShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.blueGrey,
      ),
    );
  }

  Widget _getCloseButton() {
    return style.closeButtonVisible
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Container(
              alignment: FractionalOffset.topRight,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/close.png',
                      package: 'flat_dialog',
                    ),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      closeFunction();
                    },
                  ),
                ),
              ),
            ),
          )
        : Container();
  }

  // Returns defined buttons. Default: Cancel Button
  List<Widget> _getButtons() {
    final List<Widget> expandedButtons = [];
    if (buttons != null) {
      buttons.forEach(
        (button) {
          final Widget buttonWidget = Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: button,
          );
          if (button.width != null && buttons.length == 1) {
            expandedButtons.add(buttonWidget);
          } else {
            expandedButtons.add(Expanded(
              child: buttonWidget,
            ));
          }
        },
      );
    } else {
      expandedButtons.add(
        Expanded(
          child: FlatDialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
    }

    return expandedButtons;
  }

// Returns alert image for icon
  Widget _getImage() {
    Widget response = image ?? Container();
    switch (type) {
      case DialogType.success:
        response = Image.asset(
          'assets/images/icon_success.png',
          package: 'flat_dialog',
        );
        break;
      case DialogType.error:
        response = Image.asset(
          'assets/images/icon_error.png',
          package: 'flat_dialog',
        );
        break;
      case DialogType.info:
        response = Image.asset(
          'assets/images/icon_info.png',
          package: 'flat_dialog',
        );
        break;
      case DialogType.warning:
        response = Image.asset(
          'assets/images/icon_warning.png',
          package: 'flat_dialog',
        );
        break;
      case DialogType.none:
        response = Container();
        break;
    }
    return response;
  }

// Shows alert with selected animation
  AnimatedWidget _showAnimation(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (style.animationStyle == AnimationStyle.fromRight) {
      return AnimationTransition.fromRight(
          animation, secondaryAnimation, child);
    } else if (style.animationStyle == AnimationStyle.fromLeft) {
      return AnimationTransition.fromLeft(animation, secondaryAnimation, child);
    } else if (style.animationStyle == AnimationStyle.fromBottom) {
      return AnimationTransition.fromBottom(
          animation, secondaryAnimation, child);
    } else if (style.animationStyle == AnimationStyle.grow) {
      return AnimationTransition.grow(animation, secondaryAnimation, child);
    } else if (style.animationStyle == AnimationStyle.shrink) {
      return AnimationTransition.shrink(animation, secondaryAnimation, child);
    } else {
      return AnimationTransition.fromTop(animation, secondaryAnimation, child);
    }
  }
}