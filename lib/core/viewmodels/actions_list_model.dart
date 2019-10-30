import 'package:flutter/foundation.dart';

import 'package:baloo/core/services/api.dart';

// Models
import 'package:baloo/core/models/impact_action.dart';


class ActionsListModel extends ChangeNotifier {
  Api _api;

  List<ImpactAction> _actionSearchResults;

  ActionsListModel({@required Api api}) {
    _api = api;
    _actionSearchResults = _api.getActionSearchResults();
  }

  List<ImpactAction> get actionSearchResults => _actionSearchResults;

  // TODO mjf:
  // A text input action search method


  // TODO mjf:
  // Allow users to select other action categories
}
