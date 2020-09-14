import 'package:flutter/material.dart';

class PhoneTextFormField {
  TextFormField getCustomEditTextArea({
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
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixStyle: TextStyle(color: Colors.black45),
        fillColor: Colors.white.withOpacity(0.6),
        filled: true,
        isDense: true,
        labelStyle: TextStyle(color: Colors.black45),
        focusColor: Colors.black45,
        errorStyle: TextStyle(
          color: Colors.white,
          wordSpacing: 5.0,
          fontSize: 14,
        ),
        hintText: hintValue,
        labelText: labelValue,
      ),
      validator: validator,
    );
  }
}
