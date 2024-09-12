class AppValidator {
  AppValidator._();
  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null || val.trim().isEmpty) {
      return 'this field is required .';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
);
    if (val == null || val.isEmpty) {
      return 'this field is required .';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required .';
    } else if (val == password) {
      return 'isn\'t a Same Password';
    } else {
      return null;
    }
  }
}
