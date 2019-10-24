import 'package:provider/provider.dart';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';


List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildCloneableWidget> dependentServices = [

];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  ChangeNotifierProvider<NavBarModel>(
    builder: (_) => NavBarModel(),
  ),
];
