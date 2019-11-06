import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/screens/Action/action_screen.dart';
import 'package:baloo/ui/screens/LogIn/login_screen.dart';

// Models
import 'package:baloo/core/models/user.dart';


class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return ActionScreen();
    }
    return LogIn();
  }
}
