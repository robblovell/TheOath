import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/authentication/authentication_bloc.dart';
import 'package:protestersoath/authentication/authentication_event.dart';
import 'package:protestersoath/login/bloc/login.dart';
import 'package:protestersoath/login/bloc/login_bloc.dart';
import 'package:protestersoath/login/PhoneTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/utils/sizing.dart';
import 'package:protestersoath/utils/stripCorrectPhone.dart';
import 'package:protestersoath/utils/validatePhoneNumber.dart';

class NumberInput extends StatefulWidget {
  NumberInput({Key key}) : super(key: key);

  @override
  _NumberInput createState() => _NumberInput();
}

class _NumberInput extends State<NumberInput> {
  GlobalKey<FormState> _formKey;
  TextEditingController _phoneTextController;
  FocusNode _focusNode;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _phoneTextController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double fontLabelSize = screenWidth(context) < 400 ? 13 : 15;

    // To show the keyboard on load:  _focusNode.requestFocus();
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 1.0, left: 16.0, right: 16.0),
      child:
          Stack(children: <Widget>[
          Form(
            key: _formKey,
            child: PhoneTextFormField().getCustomEditTextArea(
                labelValue: 'ENTER_PHONE_TIP'.tr(),
                hintValue: '',
                controller: _phoneTextController,
                keyboardType: TextInputType.number,
                icon: Icons.phone,
                focusNode: _focusNode,
                fontLabelSize: fontLabelSize,
                validator: (value) {
                  return validatePhoneNumber(value);
                }),
          ),
            Container(
                alignment: Alignment(-.9, 0.6),
                child: IconButton(
                  icon: Icon(
                    Icons.privacy_tip,
                    color: Colors.black,
                    size: 30,
                  ),
                  tooltip: 'PRIVACY'.tr(),
                  onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                      .add(LoginPrivacyPageEvent()),
                )),
            // I Commit Button
            Container(
              alignment: Alignment(0.0, 0.6),
              child: MaterialButton(
                elevation: 20.0,
                minWidth: 210,
                splashColor: Colors.grey[500],
                colorBrightness: Brightness.light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<LoginBloc>(context).add(SendOtpEvent(
                        phoNo: stripCorrectPhone(_phoneTextController
                            .value.text))); //, context:context));
                  }
                },
                color: Colors.grey[900],
                child: Text(
                  'I_COMMIT_BUTTON'.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
           //)
        ],
      ),
    );
  }
}
