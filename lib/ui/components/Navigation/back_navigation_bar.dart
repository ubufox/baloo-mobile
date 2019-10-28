import 'package:flutter/material.dart';


class BackNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: Color(0xFFFDFFFF),
            boxShadow: [
              new BoxShadow(
                color: Color(0x0F000000),
                offset: const Offset(0.0, 4.0),
                blurRadius: 8.0,
              ),
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Align(
            alignment: Alignment(-1.0, 0.0),
            child: Container(
              margin: const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.chevron_left),
                  Text(
                    'BACK',
                    style: TextStyle(
                      color: Color(0xFF595959),
                      fontSize: 16,
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
