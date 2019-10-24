import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseDataWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Function(T) onModelReady;
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;

  BaseDataWidget({
    Key key,
    this.model,
    this.builder,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _BaseDataWidgetState<T> createState() => _BaseDataWidgetState<T>();
}

class _BaseDataWidgetState<T extends ChangeNotifier> extends State<BaseDataWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    /* TODO mfj: WTF am I supposed to do here */
    super.dispose();
  }
}
