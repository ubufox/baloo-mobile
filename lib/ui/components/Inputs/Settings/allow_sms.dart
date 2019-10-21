import 'package:flutter/material.dart';


class AllowSMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: [
          new BoxShadow(
            color: Color(0x0F000000),
            offset: new Offset(0.0, 3.0),
            blurRadius: 8.0,
          ),
        ],
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Allow SMS messaging',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF595959),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'With SMS messaging turned on, Baloo will be able to text you weekly actions and updates from communities supporting this feature.',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF979797),
                        ),
                      ),
                    ),
                    Text(
                      'Standard messaging rates apply',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF0083BB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 69,
              child: Container(
                height: 18,
                margin: const EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: Color(0xFF16D6F9),
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
