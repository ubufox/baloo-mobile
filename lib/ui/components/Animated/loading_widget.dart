import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  String _message = 'loading';


  LoadingWidget({ String message }) {
    if (message != null) {
      _message = message;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/loading.gif"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: Text(
                _message,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
