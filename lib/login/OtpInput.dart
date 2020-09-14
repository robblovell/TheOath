import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:theprotestersoath/login/bloc/login.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Padding(
        padding:
            EdgeInsets.only(top: 18, bottom: 15.0, left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            PinInputTextField(
                pinLength: 6,
                autoFocus: true,
                decoration: UnderlineDecoration(
                  colorBuilder: PinListenColorBuilder(Colors.cyan, Colors.green),
                ),
                onSubmit: (String pin) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(VerifyOtpEvent(otp: pin));
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // Back Button
              child: RaisedButton(
                elevation: 7.0,
                splashColor: Colors.brown,
                animationDuration: Duration(seconds: 2),
                colorBrightness: Brightness.light,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(AppStartEvent());
                },
                color: Colors.orange,
                child: Text(
                  'BACK'.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
