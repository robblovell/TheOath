import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:theprotestersoath/login/bloc/login.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class PinInput extends StatefulWidget {
  PinInput({Key key}) : super(key: key);

  @override
  _PinInput createState() => _PinInput();
}

class _PinInput extends State<PinInput> {
  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = screenWidth(context);
    final double instructionFontSize = width < 400 ? 15 : 18;
    final double backArrowLeftPosition = width > 800 ? -1.03 : -1.07;
    return ConstrainedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 18, bottom: 10.0, left: 16.0, right: 16.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                PinInputTextField(
                    key: _formKey,
                    pinLength: 6,
                    autoFocus: true,
                    decoration: BoxLooseDecoration(
                      strokeColorBuilder: PinListenColorBuilder(
                          Colors.grey[800], Colors.grey[800]),
                      bgColorBuilder: PinListenColorBuilder(
                          Colors.grey[900], Colors.grey[400]),
                      textStyle: TextStyle(fontSize: 32, color: Colors.white),
                      // hintText: "Pin...",
                    ),
                    onChanged: (text) {
                      if (text.length == 6) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(VerifyOtpEvent(otp: text));
                      }
                    },
                    onSubmit: (String pin) {
                      // print("Pin: $pin");
                      BlocProvider.of<LoginBloc>(context)
                          .add(VerifyOtpEvent(otp: pin));
                    }),
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("A six digit code has been sent to your phone",
                        style: TextStyle(fontSize: instructionFontSize, color: Colors.black))),
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("Please enter it here.",
                        style: TextStyle(fontSize: instructionFontSize, color: Colors.black))),
              ],
            ),
            Container(
              alignment: Alignment(-1, 1),
              child: Text("retry"),
            ),
            Container(
                alignment: Alignment(backArrowLeftPosition, .90),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  tooltip: 'STORIES_TOOLTIP'.tr(),
                  onPressed: () => BlocProvider.of<LoginBloc>(context).add(AppStartEvent()),
                )),
          ],
        ),
      ),
      constraints: BoxConstraints.tight(Size.fromHeight(250)),
    );
  }
}
