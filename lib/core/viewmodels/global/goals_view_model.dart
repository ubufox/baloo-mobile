import 'package:graphql_flutter/graphql_flutter.dart';

// Queries
import 'package:baloo/core/queries/goals.dart';

// Services
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';
import 'package:baloo/core/models/new_goal.dart';


class GoalsViewModel extends BaseGlobalViewModel {
  List<NewGoal> _goals;


  GoalsViewModel({ GraphQLService gqls }) : super(gqls: gqls);


  List<NewGoal> get goals => _goals;


  // initialize
  @override
  void initialize(ClientAvailable hasClient) async {
    print('initialize goals model');
    if (hasClient.value == false) {
      isReady = false;
      empty();
    } else {
      setLoading(true);

      try {
        QueryResult result = await gqls.runQuery(GetGoalsQuery());

        if (result != null && result.exception == null) {
          print(result.data.toString());
          setLoading(false);
        } else if (result.exception != null) {
          throw(result.exception.toString());
        }
      } catch(e) {
        print('errors initializing goals');
        print(e.toString());
        setError(e.toString());
      }
    }
  }

  // get goals sorted by distance

  // get goals by community id
  //
  void empty() {
    _goals = null;
  }
}
