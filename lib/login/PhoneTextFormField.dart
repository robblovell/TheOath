import 'package:flutter/material.dart';

class PhoneTextFormField {
  Expanded getCustomEditTextArea({
    String labelValue = "",
    String hintValue = "",
    Function validator,
    IconData icon,
    bool validation,
    TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String validationErrorMsg,
    FocusNode focusNode,
  }) {
    return Expanded(
        child: TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixStyle: TextStyle(color: Colors.black45),
        fillColor: Colors.white.withOpacity(0.6),
        filled: true,
        isDense: true,
        labelStyle: TextStyle(color: Colors.black45, fontSize: 13),
        focusColor: Colors.black45,
        errorStyle: TextStyle(
          color: Colors.white,
          wordSpacing: 5.0,
          fontSize: 15,
        ),
        hintText: hintValue,
        labelText: labelValue,
      ),
      validator: validator,
    ));
  }
}
