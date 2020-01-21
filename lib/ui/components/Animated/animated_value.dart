import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AnimatedValue extends ImplicitlyAnimatedWidget {
  final double value;
  String unit;

  AnimatedValue({
    Key key,
    @required this.value,
    this.unit,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.decelerate,
  }) : super (duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedValueState();
}


class _AnimatedValueState extends AnimatedWidgetBaseState<AnimatedValue> {
  Tween<double> _value;

  @override
  Widget build(BuildContext context) {
    NumberFormat f = NumberFormat('###,###,###.##', 'en_US');
    String cleanedValue = f.format(_value.evaluate(animation));

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Text(
        widget.unit != null ?
          cleanedValue + ' ${widget.unit}'
          : cleanedValue,
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
