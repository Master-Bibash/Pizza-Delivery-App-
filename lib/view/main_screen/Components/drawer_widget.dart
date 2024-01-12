import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      elevation: 1,
      color: Colors.white60,
      child: ListTile(
        leading: Icon(icon),
        title: Text("${text}"),
        subtitle: Text('${text}'),
      ),
    );
  }
}
