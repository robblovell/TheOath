import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theprotestersoath/res.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Res.firebase,
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter your mobile number to contine",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}