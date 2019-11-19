import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/queries/user.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/global_data_service.dart';

// Models
import 'package:baloo/core/models/user.dart';


class ProfileModel extends BaseViewModel {
  User _user;
  final GraphQLService _gqls;
  final GlobalDataService _ds;


  ProfileModel({ GraphQLService gqls, GlobalDataService ds }) :
    _gqls = gqls,
    _ds = ds;


  User get user => _user;


  void getUser() async {
    if (_user == null) {
      setLoading(true);
      try {
        // get data from global storage
        _user = _ds.getVal(USER_KEY);
        setLoading(false);
      } catch(e) {
        print(e.toString());

        try {
          QueryResult result = await _gqls.runQuery(GetUserQuery());

          if (result != null && result.errors == null) {
            _user = User.fromJson(result.data["user"][0]);

            // user expiration should be 1 day
            DateTime userExpires = DateTime.now().add(
              Duration(days: 1)
            );
            _ds.upsert(USER_KEY, _user, userExpires);
            setLoading(false);
          } else if (result != null) {
            print(result.errors.toString());
          }
        } catch(e) {
          print(e.toString());
        }
      }
    }
  }
}
