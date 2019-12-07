import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/community.dart';
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/global/base_global_view_model.dart';


class CommunitiesViewModel extends BaseGlobalViewModel {
  List<Community> _communities;


  CommunitiesViewModel({ GraphQLService gqls }) : super(gqls: gqls);


  List<Community> get communities => _communities;


  @override
  void initialize(ClientAvailable hasClient) async {
    print('initialize communities model');
    if (hasClient.value == false) {
      isReady = false;
      clearCommunities();
    } else {
      setLoading(true);

      try {
        QueryResult result = await gqls.runQuery(GetCommunitiesQuery());

        if (result == null) {
          throw('Failed communities request');
        }

        if (result.errors == null) {
          _communities = result.data['community']
            .map<Community>(
              (comm) => Community.fromJSON(comm)
            ).toList();
          setLoading(false);
        } else {
          throw(result.errors.toString());
        }
      } catch (e) {
        print('error initializing communities');
        print(e.toString());
        setError(e.toString());
        // setLoading(false);
      }
    }
  }


  Community getCommunityById(String communityId) {
    Community result = _communities.firstWhere(
      (comm) => comm.id == communityId,
      orElse: () => null,
    );

    return result;
  }


  void clearCommunities() {
    _communities = null;
    notifyListeners();
  }
}
