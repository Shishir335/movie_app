import 'package:flutter/material.dart';

class Nav {
  static push(BuildContext context, String routeName, {dynamic arguments}) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static pushAndReplace(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  static pushAndRemoveAll(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false,
        arguments: arguments);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static getArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments;
  }
}
