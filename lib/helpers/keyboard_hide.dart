  import 'package:flutter/material.dart';

hideSoftKeyboard(currentFocus,BuildContext context) {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }