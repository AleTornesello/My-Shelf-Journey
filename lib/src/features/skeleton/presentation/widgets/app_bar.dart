import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:uuid/uuid.dart';

class MsjAppBarAction {
  String uuid = const Uuid().v4();
  final IconData? icon;
  final String label;
  final Function()? onTap;

  MsjAppBarAction({this.icon, required this.label, this.onTap});
}

class MsjAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<MsjAppBarAction>? actions;

  const MsjAppBar(
    this.title, {
    super.key,
    this.actions,
  });

  @override
  final Size preferredSize =
      const Size.fromHeight(kToolbarHeight); // default is 56.0

  @override
  MsjAppBarState createState() => MsjAppBarState();
}

class MsjAppBarState extends State<MsjAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: widget.actions == null
          ? null
          : [
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return widget.actions!.map((MsjAppBarAction action) {
                    return PopupMenuItem<String>(
                      value: action.uuid,
                      onTap: action.onTap,
                      child: Row(
                        children: [
                          if (action.icon != null) ...[
                            Icon(action.icon),
                            const Gap(StylesConstants.gap),
                          ],
                          Text(action.label),
                        ],
                      ),
                    );
                  }).toList();
                },
              )
            ],
    );
  }
}
