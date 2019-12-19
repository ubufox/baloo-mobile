import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:baloo/core/constants/routes.dart';
import 'package:baloo/ui/formatters/phone_input_formatter.dart';


class CreateAccountForm extends StatelessWidget {
  final Function onSubmit;
  final Function nameChanged;
  final Function phoneChanged;
  final Function zipChanged;


  CreateAccountForm({
    @required this.onSubmit,
    @required this.nameChanged,
    @required this.phoneChanged,
    @required this.zipChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/create_account_form_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 36.0),
                  child: Text(
                    'Create\nAccount',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Color(0xFF2F2F33),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
                Container(
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: TextField(
                    onChanged: nameChanged,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                ),
                Container(
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: TextField(
                    onChanged: phoneChanged,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter(RegExp("[0-9^-]")),
                      PhoneInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: TextField(
                    onChanged: zipChanged,
                    decoration: InputDecoration(
                      hintText: 'ZIP code',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 32.0,
            right: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                Container(
                  height: 80,
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(
                          color: Color(0xFF2F2F33),
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onSubmit(),
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Color(0xFF484A4A),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RoutePaths.LogIn),
                  child: Container(
                    margin: new EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF2F2F33),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
