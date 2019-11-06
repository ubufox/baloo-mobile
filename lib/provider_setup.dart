import 'package:provider/provider.dart';

import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/authentication_service.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';
// import 'package:baloo/core/viewmodels/loading_model.dart';

// Models
import 'package:baloo/core/models/user.dart';


List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
      AuthenticationService(api: api),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) =>
      Provider.of<AuthenticationService>(context, listen: false).user,
  ),
  ChangeNotifierProvider<NavBarModel>(
    builder: (_) => NavBarModel(),
  ),
// TODO mjf: add appwide loading wrapper
//  ChangeNotifierProvider<LoadingModel>(
//    builder: (_) => LoadingModel(),
//  ),
];
