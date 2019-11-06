import 'package:flutter/material.dart';


class LoginPhoneForm extends StatelessWidget {
  final Function onSubmit;
  final Function onChanged;


  LoginPhoneForm({
    @required this.onSubmit,
    @required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_form_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: new EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 48.0),
              child: Text(
                'Log In',
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
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                ),
              ),
            ),
            Container(
              height: 80,
              margin: new EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log In',
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
            Container(
              margin: new EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
              child: Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
