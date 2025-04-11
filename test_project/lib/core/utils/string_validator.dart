class StringValidator {
  static const String _emailPattern =
      r'^[^@.]+(\.[^@.]+)*@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String _phonePattern = r'^(?:\+7|7|8)[-()]*\d{3}[-()]*\d{3}[-()]*\d{2}[-()]*\d{2}$';

  static bool validateEmail({required String email}) {
    final regExp = RegExp(_emailPattern);

    return regExp.hasMatch(email);
  }

  static bool validatePhone({required String phone}) {
    final regExp = RegExp(_phonePattern);

    return regExp.hasMatch(phone);
  }
}
