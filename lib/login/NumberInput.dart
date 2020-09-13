import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/login/bloc/bloc.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:theprotestersoath/utils/EditTextUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 18, bottom: 15.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: EditTextUtils().getCustomEditTextArea(
                labelValue: 'ENTER_PHONE_TIP'.tr(),
                hintValue: "",
                controller: _phoneTextController,
                keyboardType: TextInputType.number,
                icon: Icons.phone,
                validator: (value) {
                  return validateMobile(value);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: RaisedButton(
              elevation: 7.0,
              splashColor: Colors.brown,
              animationDuration: Duration(seconds: 2),
              colorBrightness: Brightness.light,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(9.0),
                ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(SendOtpEvent(
                      phoNo: this.StripCorrectPhone(_phoneTextController.value.text))); //, context:context));
                }
              },
              color: Colors.orange,
              child: Text(
                'I_COMMIT'.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
  String StripCorrectPhone(phone) {
    // remove all characters that are not digits or a plus sign
    // assume that a +1 or +011 is not given and we need to add +1.
    final String prefix =  (phone.substring(0,1) != '+') ? "+1":"";
    final RegExp regExp = new RegExp(r'\W+');
    final String strippedPhone = phone.replaceAll(regExp,'');
    return prefix + strippedPhone;
  }

  String validateMobile(String value) {
    final String pattern = r'^[+]{0,1}[\s]{0,1}[\d]{0,3}[\s]{0,1}[-(]{0,1}[\d]{1,4}[-)]{0,1}[\s]{0,1}[-\s\.\d]{3,10}$';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value))
      return 'INVALID_PHONE_REGEX'.tr();
    else
      return null;
  }
}
