import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/ui/screens/CreateAccount/create_account_form.dart';
import 'package:baloo/ui/screens/CreateAccount/create_account_confirm_code_form.dart';
import 'package:baloo/ui/screens/loading_screen.dart';

// Models
import 'package:baloo/core/viewmodels/create_account_model.dart';
import 'package:baloo/core/models/user.dart';


class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDataWidget(
      model: CreateAccountModel(authenticationService: Provider.of(context)),
      onModelReady: (model) => {},
      builder: (context, account, child) {
        if (account.loading) {
          return LoadingScreen();
        }

        switch(account.onStep) {
          case 1:
            return CreateAccountForm(
              onSubmit: account.createAccount,
              nameChanged: account.updateName,
              phoneChanged: account.updatePhone,
              zipChanged: account.updateZipcode,
            );
          case 2:
            return CreateAccountConfirmCodeForm(
              onSubmit: account.submitConfirmation,
              onChanged: account.updateCode,
              onBack: account.goBack,
              phone: account.phone,
            );
          default:
            return CreateAccountForm(
              onSubmit: account.createAccount,
              nameChanged: account.updateName,
              phoneChanged: account.updatePhone,
              zipChanged: account.updateZipcode,
            );
        }
      }
    );
  }
}
