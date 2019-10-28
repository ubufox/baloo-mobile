import 'package:flutter/material.dart';


class ActionButton extends StatefulWidget {
  final onPressed;

  ActionButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  ActionButtonState createState() => ActionButtonState();
}


class ActionButtonState extends State<ActionButton> with SingleTickerProviderStateMixin{
  AnimationController animationController;

  bool calledCompleteAction = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animationController.addListener(() {
      // this causes a rerender of the widget
      setState(() {
        if (animationController.value >= 0.8 && !calledCompleteAction) {
          calledCompleteAction = true;
          widget.onPressed();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => animationController.forward(),
      onTapUp: (_) {
        if (animationController.status == AnimationStatus.forward && animationController.value < 0.8) {
          animationController.reverse();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 160,
            width: 160,
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
            height: 140,
            width: 140,
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
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150.0,
            width: 150.0,
            child: CircularProgressIndicator(
              value: animationController.value,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1DC8F1)),
              strokeWidth: 10.0
            ),
          ),
        ],
      ),
    );
  }
}

