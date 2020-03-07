import 'package:provider/provider.dart';

// Services
import 'package:baloo/core/services/api.dart';
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/authentication_service.dart';

// Models
import 'package:baloo/core/models/authentication.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/nav_bar_model.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_communities_view_model.dart';
import 'package:baloo/core/viewmodels/global/communities_view_model.dart';
import 'package:baloo/core/viewmodels/global/engagement_view_model.dart';
import 'package:baloo/core/viewmodels/global/goals_view_model.dart';


List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildCloneableWidget> dependentServices = [
  // TODO mjf: update to AUTH API
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
      AuthenticationService(api: api),
  ),
  ProxyProvider<AuthenticationService, GraphQLService>(
    builder: (context, authService, gqls) =>
      GraphQLService(authService: authService),
  ),
  StreamProvider<Authentication>(
    builder: (context) =>
      Provider.of<AuthenticationService>(context, listen: false).jwt,
  ),
];

// What reused data needs to be available to multiple routes?
//
// User XXX
// <List>UserCommunity XXX
// <List>UserAction
// UserGoal
// UserFocus
List<SingleChildCloneableWidget> uiConsumableProviders = [
  ChangeNotifierProxyProvider<GraphQLService, UserViewModel>(
    builder: (context, gqls, user) =>
      UserViewModel(gqls: gqls),
  ),
  ChangeNotifierProxyProvider<GraphQLService, UserCommunitiesViewModel>(
    builder: (context, gqls, userCommunities) =>
      UserCommunitiesViewModel(gqls: gqls),
  ),
  ChangeNotifierProxyProvider<GraphQLService, CommunitiesViewModel>(
    builder: (context, gqls, communities) =>
      CommunitiesViewModel(gqls: gqls),
  ),
  ChangeNotifierProxyProvider<GraphQLService, EngagementViewModel>(
    builder: (context, gqls, engagement) =>
      EngagementViewModel(
        gqls: gqls,
        api: Provider.of<Api>(context),
      ),
  ),
  ChangeNotifierProxyProvider<GraphQLService, GoalsViewModel>(
    builder: (context, gqls, goals) =>
      GoalsViewModel(gqls: gqls),
  ),
  ChangeNotifierProvider<NavBarModel>(
    builder: (_) => NavBarModel(),
  ),
];
