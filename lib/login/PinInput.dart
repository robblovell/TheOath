import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:theprotestersoath/login/bloc/login.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class PinInput extends StatefulWidget {

  PinInput({Key key}) : super(key: key);

  @override
  _PinInput createState() => _PinInput();
}

class _PinInput extends State<PinInput> {
  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = new GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Padding(
        padding:
            EdgeInsets.only(top: 18, bottom: 15.0, left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            PinInputTextField(
                key: _formKey,
                pinLength: 6,
                autoFocus: true,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: PinListenColorBuilder(Colors.green, Colors.grey[800]),
                    bgColorBuilder: PinListenColorBuilder(Colors.green, Colors.grey[400]),
                ),
                onChanged: (text) {
                  print("Pin... : $text");
                  if (text.length == 6) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(VerifyOtpEvent(otp: text));
                  }
                },
                onSubmit: (String pin) {
                  print("Pin: $pin");
                  BlocProvider.of<LoginBloc>(context)
                      .add(VerifyOtpEvent(otp: pin));
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // Back Button
              child: SizedBox(
                width: 100, // specific value
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
                  color: Colors.green,
                  child: Text(
                    'BACK'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      constraints: BoxConstraints.tight(Size.fromHeight(250)),
    );
  }
}
