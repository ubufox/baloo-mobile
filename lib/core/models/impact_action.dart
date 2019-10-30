import 'package:baloo/core/models/action_data.dart';


class ImpactAction {
  final List<ActionData> _impact;
  bool _isCurrentFocus;
  String _message;

  ImpactAction(
    this._impact,
    this._isCurrentFocus,
    this._message,
  );

  List<ActionData> get impact => _impact;
  bool get isCurrentFocus => !!_isCurrentFocus;
  String get message => _message;
}
