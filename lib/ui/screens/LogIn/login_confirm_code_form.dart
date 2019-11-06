import 'package:flutter/material.dart';


class LoginConfirmCode extends StatelessWidget {
  final Function onSubmit;
  final Function onChanged;
  final Function onBack;
  final String phone;


  LoginConfirmCode({
    @required this.onSubmit,
    @required this.onChanged,
    @required this.onBack,
    @required this.phone,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: GestureDetector(
                onTap: onBack,
                child: Container(
                  height: 48,
                  width: 48,
                  color: Color(0xFF484A4A),
                ),
              ),
            ),
            Container(
              child: Text(
                'Confirmation',
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
              child: Text(
                'Please enter the code we sent to $phone to confirm we have the correct number',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              child: TextField(
                onChanged: onChanged,
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Text('Log In'),
                  GestureDetector(
                    onTap: onSubmit,
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Color(0xFF484A4A)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
