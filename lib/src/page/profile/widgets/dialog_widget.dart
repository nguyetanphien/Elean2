import 'package:flutter/material.dart';

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actionsPadding: const EdgeInsets.all(20),
      icon: icon,
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
            ),
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      content: message == null
          ? null
          : Text(
              message!,
              textAlign: TextAlign.center,
            ),
      contentTextStyle: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
