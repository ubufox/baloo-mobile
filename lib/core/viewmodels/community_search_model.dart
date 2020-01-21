import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/community.dart';
import 'package:baloo/core/queries/user.dart';

// Services
import 'package:baloo/core/services/graphql.dart';
import 'package:baloo/core/services/global_data_service.dart';

// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user.dart';


class CommunitySearchModel extends BaseViewModel {
  final GraphQLService _gqls;
  final GlobalDataService _ds;
  List<Community> _rawCommunities;
  List<Community> _communities;
  String _sortBy = "NEARBY";
  String _search;

  // Needed for search
  User _user;


  CommunitySearchModel({
    GraphQLService gqls,
    GlobalDataService ds,
  }) :
    _gqls = gqls,
    _ds = ds;


  List<Community> get communities {
    if (_communities == null) {
      _communities = new List<Community>.from(_rawCommunities);
      sortCommunities();
    }
    return _communities;
  }
  int get count => _communities == null ? 0 : _communities.length;


  void getCommunities() async {
    if (_rawCommunities == null) {
      setLoading(true);
      try {
        _rawCommunities = _ds.getVal(COMMUNITIES_LIST_KEY);
        setLoading(false);
      } catch(e) {
        print(e.toString());

        try {
          QueryResult result = await _gqls.runQuery(GetCommunitiesQuery());

          if (result != null && result.exception == null) {
            _rawCommunities = result.data['community'].map<Community>(
              (comm) => Community.fromJSON(comm)
            ).toList();

            _ds.upsert(COMMUNITIES_LIST_KEY, _rawCommunities);
            setLoading(false);
          } else if (result != null) {
            print('result exception');
            print(result.exception.toString());
          }
        } catch(e) {
          print(e.toString());
        }
      }
    }
  }

  void getUser() async {
    if (_user == null) {
      setLoading(true);
      try {
        _user = _ds.getVal(USER_KEY);
        setLoading(false);
      } catch(e) {
        QueryResult uRes = await _gqls.runQuery(GetUserQuery());

        if (uRes!= null && uRes.exception == null) {
          _user = User.fromJSON(uRes.data["user"][0]);

          DateTime userExpires = DateTime.now().add(
            Duration(days: 1)
          );
          _ds.upsert(USER_KEY, _user, userExpires);
          setLoading(false);
        } else if (uRes.exception != null) {
          print(uRes.exception.toString());
          throw(uRes.exception.toString());
        }
      }
    }
  }


  List<Community> sortCommunities() {
    switch(_sortBy) {
      case 'POPULAR':
        _communities.sort(sortByDistance);
        break;
      case 'NEWEST':
        _communities.sort(sortByDistance);
        break;
      default:
        _communities.sort(sortByDistance);
        break;
    }
  }


  int sortByDistance(Community a, Community b) {
    // get the first 5 numbers for zips with that extra shit at the end
    int userZip = int.tryParse(_user.zipcode.substring(0, 5));
    int zipAInt = int.tryParse(a.zipcode.substring(0, 5));
    int zipBInt = int.tryParse(b.zipcode.substring(0, 5));

    int distanceA = (userZip - zipAInt).abs();
    int distanceB = (userZip - zipBInt).abs();

    if (distanceA == distanceB) {
      return 0;
    } else if (distanceA < distanceB) {
      return -1;
    } else {
      return 1;
    }
  }


  List<Community> searchCommunities(String sortBy, [String query]) {
    _sortBy = sortBy;
    _search = query;

    if (query != null) {
      _communities = List<Community>.from(_rawCommunities);
      _communities = _communities
        .where((c) =>
          c.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }

    if (_user != null) {
      sortCommunities();
    }

    notifyListeners();
  }
}
