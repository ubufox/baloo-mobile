import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/components/Navigation/nav_bar.dart';


class ActionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.7, -0.4),
            radius: 1.3,
            colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFFF9FFFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: _actionButton(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: NavBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.Action);
        },
        tooltip: 'Weekly action',
        child: Icon(Icons.flash_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _actionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 56.0),
      height: 188,
      width: 188,
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
      child: Center(
        child: Container(
          height: 168,
          width: 168,
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
              width: 116,
              child: Center(
                child: Text(
                  'I ate a plant-based meal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2F2F33),
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
