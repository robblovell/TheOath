import 'package:flutter/material.dart';

class PhoneTextFormField {
  Container getCustomEditTextArea({
    String labelValue = "",
    String hintValue = "",
    double fontLabelSize = 15,
    Function validator,
    IconData icon,
    bool validation,
    TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String validationErrorMsg,
    FocusNode focusNode,
  }) {
    return Container(
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
        labelStyle: TextStyle(color: Colors.grey[800], fontSize: fontLabelSize),
        focusColor: Colors.black,
        errorStyle: TextStyle(
          color: Colors.white,
          wordSpacing: 5.0,
          fontSize: fontLabelSize+2,
        ),
        hintText: hintValue,
        labelText: labelValue,
      ),
      validator: validator,
    ));
  }
}
