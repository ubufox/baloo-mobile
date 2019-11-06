import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/LogIn/login_phone_form.dart';
import 'package:baloo/ui/screens/LogIn/login_confirm_code_form.dart';
import 'package:baloo/ui/screens/Action/action_screen.dart';

// Models
import 'package:baloo/core/viewmodels/login_model.dart';
import 'package:baloo/core/models/user.dart';


class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDataWidget(
      model: LoginModel(authenticationService: Provider.of(context)),
      onModelReady: (model) => { /* TODO mjf: fetch data */ },
      builder: (context, login, child) {
        switch(login.onStep) {
          case 1:
            return LoginPhoneForm(
              onSubmit: login.submitPhone,
              onChanged: login.updatePhone,
            );
          case 2:
            return LoginConfirmCode(
              onSubmit: login.submitConfirmation,
              onChanged: login.updateCode,
              onBack: login.goBack,
              phone: login.phone,
            );
          default:
            return LoginPhoneForm(
              onSubmit: login.submitPhone,
              onChanged: login.updatePhone,
            );
        }
      },
    );
  }
}
