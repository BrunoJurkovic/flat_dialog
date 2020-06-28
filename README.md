# **flat_dialog**

Modified, more updated fork of [rflutter_alert](https://pub.dev/packages/rflutter_alert).
FlatDialog is a simple method of creating various popup dialogs in Flutter. 

 ![Error Dialog](https://i.imgur.com/CNsf6jC.png)
# Features
- Simple animations
- Production ready dialog styles
- Recyclable and reusable dialogs
- Flat, easy to understand and beautiful

# Let's begin!

 1.  **Add dependency to your app:**
 ```yaml
dependencies:
	flat_dialog: ^1.0.0
```

2. **Use some of our ready dialogs!**
```dart
Future<bool> throwErrorDialog(BuildContext context) {
    return FlatDialog(
      context: context,
      type: DialogType.error, // We have more of these!
      title: "ERROR",
      desc: "We can't reach our server :(, try again later.",
      buttons: [
        FlatDialogButton(
		  width: 150,
		  onPressed: () => Navigator.pop(context),
          child: const Text(
            "Oh no!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
```

3.  **Customize your new flat dialog (with `style`)!** 
```dart
AlertStyle(
      animationStyle: AnimationStyle.fromTop, // How the dialog animates
      closeButtonVisible: false, // Does the [x] in the corner appear?
      isTapDismiss: true, // If you click outside the dialog, does it close?
      descStyle: TextStyle(fontWeight: FontWeight.bold), // How does the text look? 
      animationDuration: const Duration(milliseconds: 400), // How long does the animation last?
      alertBorder: RoundedRectangleBorder( // Do you want a border around the dialog?
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red, // What color is the [title] text?
      ),
      boxConstraints: const BoxConstraints.expand( // Do you want constraints?
        width: 300,
      ),
    );
```

4. **Check out the example project for even more features!**

# Want to contribute?
- Open a pull request
- Make a new issue on GitHub.

Giant thank you to [Ratel](https://ratel.com.tr/ "Ratel") and [İzzet Öztürk](https://tr.linkedin.com/in/paltimoz "İzzet Öztürk") for providing the base for this project <3.