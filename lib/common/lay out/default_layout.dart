import 'package:flutter/material.dart';


class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
    );
  }

  renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title!,)
        ,);
    }
  }
}
