import 'package:provider/provider.dart';

// Services
import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/authentication_service.dart';

// Models
import 'package:baloo/core/models/authentication.dart';
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
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
      AuthenticationService(api: api),
  ),
  ProxyProvider<AuthenticationService, GraphQLService>(
    builder: (context, authService, gqls) =>
      GraphQLService(authService: authService),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<Authentication>(
    builder: (context) =>
      Provider.of<AuthenticationService>(context, listen: false).jwt,
  ),
  ChangeNotifierProvider<NavBarModel>(
    builder: (_) => NavBarModel(),
  ),
];
