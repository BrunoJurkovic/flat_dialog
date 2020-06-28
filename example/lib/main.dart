import 'package:flutter/material.dart';
import 'package:flat_dialog/flat_dialog.dart';

void main() => runApp(RatelApp());

class RatelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlatDialog'),
        ),
        body: PopupDialog(),
      ),
    );
  }
}

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Normal Dialog'),
              onPressed: () => _onBasicAlertPressed(context),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Error Dialog'),
              onPressed: () => _onAlertButtonPressed(context),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Dialog with Gradient Buttons'),
              onPressed: () => _onAlertButtonsPressed(context),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Dialog with a Custom Style'),
              onPressed: () => _onAlertWithStylePressed(context),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Dialog with an Custom Image'),
              onPressed: () => _onAlertWithCustomImagePressed(context),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 300,
            decoration:
                BoxDecoration(color: Colors.indigoAccent.withOpacity(0.8)),
            child: FlatButton(
              child: Text('Dialog with some Custom Content'),
              onPressed: () => _onAlertWithCustomContentPressed(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onBasicAlertPressed(BuildContext context) {
    return Alert(
            context: context,
            title: "DIALOG",
            desc: "Here is some example text.")
        .show();
  }

  Future<bool> _onAlertButtonPressed(BuildContext context) {
    return Alert(
      context: context,
      type: DialogType.error,
      title: "DIALOG EXAMPLE",
      desc: "Some text for you to understand the layout :)",
      buttons: [
        FlatDialogButton(
          child: const Text(
            "Amazing!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 150,
        )
      ],
    ).show();
  }

  Future<bool> _onAlertButtonsPressed(BuildContext context) {
    return Alert(
      context: context,
      type: DialogType.warning,
      title: "DIALOG",
      desc: "Here is another dialog example.",
      buttons: [
        FlatDialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        FlatDialogButton(
          child: const Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  Future<bool> _onAlertWithStylePressed(BuildContext context) {
    final AlertStyle alertStyle = AlertStyle(
        animationStyle: AnimationStyle.fromTop,
        closeButtonVisible: false,
        isTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: const Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.red,
        ),
        boxConstraints: const BoxConstraints.expand(width: 300));

    return Alert(
      context: context,
      style: alertStyle,
      type: DialogType.info,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        FlatDialogButton(
          child: Text(
            "Okay",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  Future<bool> _onAlertWithCustomImagePressed(BuildContext context) {
    return Alert(
      context: context,
      title: "Alert with a different image.",
      desc: "Custom image example",
      image: Image.asset("assets/images/success.png"),
    ).show();
  }

  Future<bool> _onAlertWithCustomContentPressed(BuildContext context) {
    return Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'E-Mail',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          FlatDialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
