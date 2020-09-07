import 'package:theprotestersoath/login/bloc/bloc.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OtpInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 48, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            PinEntryTextField(
                fields: 6,
                onSubmit: (String pin) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(VerifyOtpEvent(otp: pin));
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(AppStartEvent());
                },
                color: Colors.orange,
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      constraints: BoxConstraints.tight(Size.fromHeight(250)),
    );
  }
}
