import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final List<Widget>? widgets;
  final Color? color;

  const BaseAppBar(
      {Key? key,
      required this.title,
      required this.appBar,
      this.widgets,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      // backgroundColor: backgroundColor,
      actions: widgets,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: color,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
