import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/user.dart';
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/user.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';


class UserViewModel extends BaseGlobalViewModel {
  User _user;


  UserViewModel({ GraphQLService gqls }) : super(gqls: gqls);


  User get user => _user;


  // should get user when the graphql
  // client has been authenticated
  @override
  void initialize(ClientAvailable hasClient) async {
    print('initialize user view model');
    if (hasClient.value == false) {
      isReady = false;
      clearUser();
    } else {
      setLoading(true);

      try {
        QueryResult result = await gqls.runQuery(GetUserQuery());

        if (result != null && result.errors == null) {
          _user = User.fromJSON(result.data["user"][0]);

          isReady = true;
          setLoading(false);
        } else if(result.errors != null){
          throw(result.errors.toString());
        }
      } catch(e) {
        print('error initializing user');
        print(e.toString());
        setError(e.toString());
        // setLoading(false);
      }
    }
  }

  // TODO mjf
  void updateUser() async {

  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  // TODO mjf: set up an offline experience that
  // syncs mutations when reconnected
}


