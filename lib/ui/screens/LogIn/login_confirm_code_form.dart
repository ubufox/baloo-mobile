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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_confirmation_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40.0,
                width: 40.0,
                margin: new EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: onBack,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color(0xFF484A4A),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 16.0),
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
              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 48.0),
              child: Text(
                'Please enter the code we sent to $phone to confirm we have the correct number',
                style: TextStyle(
                  color: Color(0xFF2F2F33),
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Enter code here',
                ),
              ),
            ),
            Container(
              height: 80,
              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Confirm',
                    style: TextStyle(
                      color: Color(0xFF2F2F33),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: onSubmit,
                    child: Container(
                      height: 80,
                      width: 80,
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
          ],
        ),
      ),
    );
  }
}
