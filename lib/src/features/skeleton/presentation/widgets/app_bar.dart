import 'package:flutter/material.dart';

class MsjAppBarState extends State<MsjAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      // foregroundColor: Theme.of(context).primaryColor,
    );
  }
}

class MsjAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const MsjAppBar(
    this.title, {
    super.key,
  });

  @override
  final Size preferredSize =
      const Size.fromHeight(kToolbarHeight); // default is 56.0

  @override
  MsjAppBarState createState() => MsjAppBarState();
}
