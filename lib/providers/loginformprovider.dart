import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String contra = '';

  bool isValidForm() {
    debugPrint(formKey.currentState?.validate().toString());
    debugPrint("$email - $contra");

    return formKey.currentState?.validate() ?? false;
  }
}
