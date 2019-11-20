import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:baloo/core/queries/community.dart';

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
  List<Community> _communities;
  String _sortBy = "NEARBY";
  String _search;


  CommunitySearchModel({
    GraphQLService gqls,
    GlobalDataService ds,
  }) :
    _gqls = gqls,
    _ds = ds;


  List<Community> get communities => _communities;
  int get length => _communities.length;


  void getCommunities() async {
    if (_communities == null) {
      setLoading(true);
      try {
        _communities = _ds.getVal(COMMUNITIES_LIST_KEY);
        setLoading(false);
      } catch(e) {
        print(e.toString());

        try {
          QueryResult result = await _gqls.runQuery(GetCommunitiesQuery());
          print('result');
          print(result.toString());

          if (result != null && result.errors == null) {
            print('result');
            print(result.data.toString());

            _communities = result.data['community'].map(
              (comm) => Community.fromJSON(comm)
            ).toList();

            _ds.upsert(COMMUNITIES_LIST_KEY, _communities);
            setLoading(false);
          } else if (result != null) {
            print('result errors');
            print(result.errors.toString());
          }
        } catch(e) {
          print(e.toString());
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
    User _user;

    try {
      _user = _ds.getVal(USER_KEY);
    } catch(e) {
      throw('User doesnt exist');
    }

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


  Future<List<Community>> searchCommunities(String sortBy, [String query]) async {
    _sortBy = sortBy;
    _search = query;

    await getCommunities();

    if (query != null && query != "") {
      _communities = _communities
        .where((c) =>
          c.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
    sortCommunities();

    notifyListeners();
  }
}
