import 'package:flutter/material.dart';

class MsjAppBarState extends State<MsjAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
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
