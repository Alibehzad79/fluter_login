import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  bool isObscurePassword;
  Icon iconPassword = Icon(Icons.visibility_off);
  bool isObscurePasswordConfirm;
  Icon IconPasswordConfirm = Icon(Icons.visibility_off);

  PasswordProvider({
    this.isObscurePassword = true,
    this.isObscurePasswordConfirm = true,
  });

  getShowPassword() {
    isObscurePassword = !isObscurePassword;
    iconPassword =
        isObscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    notifyListeners();
  }

  getShowPasswordConfirm() {
    isObscurePasswordConfirm = !isObscurePasswordConfirm;
    IconPasswordConfirm = isObscurePasswordConfirm
        ? Icon(Icons.visibility)
        : Icon(Icons.visibility_off);
    notifyListeners();
  }
}
