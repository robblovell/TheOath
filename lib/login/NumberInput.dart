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
      const EdgeInsets.only(top: 48, bottom: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: EditTextUtils().getCustomEditTextArea(
                labelValue: "Enter phone number",
                hintValue: "9876543210",
                controller: _phoneTextController,
                keyboardType: TextInputType.number,
                icon: Icons.phone,
                validator: (value) {
                  return validateMobile(value);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(SendOtpEvent(
                      phoNo: "+1" + _phoneTextController.value.text));
                }
              },
              color: Colors.orange,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 10 || value.length > 14)
      return 'Mobile Number must be 10 to 14 digits long';
    else
      return null;
  }
}
