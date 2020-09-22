String stripCorrectPhone(phone) {
  // remove all characters that are not digits or a plus sign
  // assume that a +1 or +011 is not given and we need to add +1.
  final String prefix = (phone.substring(0, 1) != '+1')
      ? "+1"
      : (phone.substring(0, 0) != '+')
      ? "+"
      : "";
  final RegExp regExp = RegExp(r'\W+');
  final String strippedPhone = phone.replaceAll(regExp, '');
  print(prefix + strippedPhone);
  return prefix + strippedPhone;
}

