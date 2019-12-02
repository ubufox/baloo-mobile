// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/communities_view_model.dart';
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user.dart';


class CommunitySearchModel extends BaseViewModel {
  String _filter;
  String _query;
  List<Community> _results;

  CommunitiesViewModel _cvm;
  User _user;


  CommunitySearchModel({
    CommunitiesViewModel cvm,
    User user,
  }) {
    _cvm = cvm;
    _user = user;

    _results = List<Community>.from(_cvm.communities);
    _updateSearchResults();
  }


  List<Community> get results => _results;
  int get count => _results == null ? 0 : _results.length;


  void _updateSearchResults() {
    setLoading(true);
    // create a new list of results so we don't edit the global
    // community list
    _results = List<Community>.from(_cvm.communities);

    // TODO mjf: improve search algorithm
    if (_query != null) {
      _results = _results
        .where((c) =>
          c.name.toLowerCase().contains(_query.toLowerCase())
        ).toList();
    }

    _sortCommunities();
    setLoading(false);
  }

  void _sortCommunities() {
    switch(_filter) {
      case 'POPULAR':
        _results.sort((Community a, Community b) {
          if (a.members > b.members) {
            return -1;
          } else if (a.members < b.members) {
            return 1;
          }
          return 0;
        });
        break;
      case 'NEWEST':
        _results.sort((Community a, Community b) {
          if (a.createdAt.isAfter(b.createdAt)) {
            return -1;
          } else if (a.createdAt.isBefore(b.createdAt)) {
            return 1;
          }
          return 0;
        });
        break;
      default:
        _results.sort(_sortByDistance);
        break;
    }
  }

  int _sortByDistance(Community a, Community b) {
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

  void updateQuery(String nQuery) {
    _query = nQuery;
    _updateSearchResults();
  }

  void updateFilter(String nFilter) {
    _filter = nFilter;
    _updateSearchResults();
  }
}
