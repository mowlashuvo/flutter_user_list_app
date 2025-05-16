import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static AlertDialog appExitDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure?',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      content: Text('Do you want to exit an App',
          style: Theme.of(context).textTheme.displaySmall),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('No', style: Theme.of(context).textTheme.displaySmall),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text('Yes', style: Theme.of(context).textTheme.displaySmall),
        ),
      ],
    );
  }

  static AlertDialog logOutDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure?',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      content: Text('Do you want to logout',
          style: Theme.of(context).textTheme.displaySmall),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('No', style: Theme.of(context).textTheme.displaySmall),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Yes', style: Theme.of(context).textTheme.displaySmall),
        ),
      ],
    );
  }

  static AlertDialog deleteAccountDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure?',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      content: Text('Do you want to delete your account?',
          style: Theme.of(context).textTheme.displaySmall),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('No', style: Theme.of(context).textTheme.displaySmall),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Yes', style: Theme.of(context).textTheme.displaySmall),
        ),
      ],
    );
  }
}
