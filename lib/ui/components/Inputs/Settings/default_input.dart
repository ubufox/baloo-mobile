import 'package:flutter/material.dart';


class DefaultSettingsInput extends StatelessWidget {
  DefaultSettingsInput({
    @required this.label,
    @required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                        '$label',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF595959),
                        ),
                      ),
                    ),
                    Text(
                      '$value',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color(0xFF595959),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 24,
              child: Icon(
                Icons.edit,
                color: Color(0xFF03A1E5),
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
