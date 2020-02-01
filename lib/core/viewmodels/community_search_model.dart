import 'dart:math';
import 'package:flutter/foundation.dart';


// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/communities_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user.dart';


class CommunitySearchModel extends BaseViewModel {
  CommunitiesViewModel _cvm;
  UserViewModel _uvm;

  List<Community> _searchResults;
  String _sortBy = "NEARBY";
  String _search;


  CommunitySearchModel({
    CommunitiesViewModel cvm,
    UserViewModel uvm,
  }) :
    _cvm = cvm,
    _uvm = uvm;


  List<Community> get results {
    print('search results');
    print(_searchResults.toString());

    if (_searchResults == null) {
      _searchResults = new List<Community>.from(_cvm.communities);
      sortResults();
    }

    return _searchResults;
  }

  int get count => _searchResults == null ? 0 : _searchResults.length;


  List<Community> sortResults() {
    switch(_sortBy) {
      case 'POPULAR':
        _searchResults.sort(sortByDistance);
        break;
      case 'NEWEST':
        _searchResults.sort(sortByDistance);
        break;
      default:
        _searchResults.sort(sortByDistance);
        break;
    }
  }


  int sortByDistance(Community a, Community b) {
    // get the first 5 numbers for zips with that extra shit at the end
    int userZip = int.tryParse(_uvm.user.zipcode.substring(0, 5));
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
      _searchResults = List<Community>.from(_cvm.communities);
      _searchResults = _searchResults
        .where((c) =>
          c.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }

    sortCommunities();
    notifyListeners();
  }
}
