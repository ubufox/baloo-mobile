import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baloo/ui/components/base_data_widget.dart';
import 'package:baloo/core/constants/routes.dart';

// Services
import 'package:baloo/core/services/authentication_service.dart';

// Models
import 'package:baloo/core/viewmodels/nav_bar_model.dart';


class LogoutButton extends StatefulWidget {
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> with SingleTickerProviderStateMixin{
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 1.0) {
          AuthenticationService auth = Provider.of<AuthenticationService>(context);
          final nav = Provider.of<NavBarModel>(context);

          auth.logout();

          Future.delayed(
            Duration(milliseconds: 750),
            () {
              nav.updateRoute(RoutePaths.AuthCheck);
              Navigator.pushNamed(context, RoutePaths.AuthCheck);
            },
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => animationController.forward(),
      onTapUp: (_) {
        if (animationController.status == AnimationStatus.forward) {
          animationController.reverse();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: const Color(0x1F000000),
                  offset: const Offset(0.0, 1.0),
                ),
                const BoxShadow(
                  color: const Color(0xFFFFFFFF),
                  spreadRadius: 0.0,
                  blurRadius: 7.0,
                ),
              ],
              borderRadius: BorderRadius.circular(94.0),
            ),
          ),
          Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: [
                const BoxShadow(
                  color: const Color(0x1F000000),
                  offset: const Offset(0.0, 5.0),
                  blurRadius: 14.0,
                ),
              ],
              borderRadius: BorderRadius.circular(89.0),
            ),
            child: Center(
              child: Container(
                width: 60,
                child: Center(
                  child: Text(
                    'Log out',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2F2F33),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 94.0,
            width: 94.0,
            child: CircularProgressIndicator(
              value: animationController.value,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDC4600)),
              strokeWidth: 6.0
            ),
          ),
        ],

      ),
    );
  }
}
