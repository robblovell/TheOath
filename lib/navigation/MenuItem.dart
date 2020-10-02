import 'package:flutter/material.dart';
import 'package:protestersoath/authentication/authentication.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final onTap;
  final String text;

  MenuItem(this.text, this.icon, this.onTap);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text,
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}
