import 'package:baloo/core/models/action_data.dart';


class ImpactAction {
  final List<ActionData> _impact;
  bool _isCurrentFocus;

  ImpactAction(
    this._impact,
    this._isCurrentFocus,
  );

  List<ActionData> get impact => _impact;
  bool get isCurrentFocus => !!_isCurrentFocus;
}
