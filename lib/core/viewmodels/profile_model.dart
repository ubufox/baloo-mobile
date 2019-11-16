import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/queries/user.dart';

// Services
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/user.dart';


class ProfileModel extends BaseViewModel {
  User _user;
  final GraphQLService _gqls;


  ProfileModel({ GraphQLService gqls }) : _gqls = gqls;


  User get user => _user;


  void getUser() async {
    if (_user == null) {
      setLoading(true);
      try {
        QueryResult result = await _gqls.runQuery(GetUserQuery);

        if (result != null && result.errors == null) {
          _user = User.fromJson(result.data["user"][0]);
          setLoading(false);
        } else if (result != null) {
          print(result.errors.toString());
        }
      } catch(e) {
        print('error');
        print(e.toString());
      }
    }
  }
}
