import 'package:flutter/material.dart';


class AnimatedValue extends ImplicitlyAnimatedWidget {
  final double value;

  AnimatedValue({
    Key key,
    @required this.value,
    Duration duration = Duration(milliseconds: 1000),
    Curve curve = Curves.linear,
  }) : super (duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedValueState();
}


class _AnimatedValueState extends AnimatedWidgetBaseState<AnimatedValue> {
  Tween<double> _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Text(
        _value.evaluate(animation).toStringAsFixed(2),
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _value = visitor(
      _value,
      widget.value,
      (dynamic value) => Tween<double>(begin: value),
    );
  }
}
