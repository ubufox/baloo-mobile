// Models
import 'package:baloo/core/models/user_community.dart';
import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/user.dart';

import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';
import 'package:baloo/core/viewmodels/global/communities_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_communities_view_model.dart';


class CommunityDetailModel extends BaseViewModel {
  CommunitiesViewModel _cvm;
  UserCommunitiesViewModel _ucvm;
  UserViewModel _uvm;
  String _communityId;

  Community _community;

  CommunityDetailModel({
    CommunitiesViewModel cvm,
    UserCommunitiesViewModel ucvm,
    UserViewModel uvm,
    String communityId,
  }) :
    _cvm = cvm,
    _ucvm = ucvm,
    _uvm = uvm,
    _communityId = communityId;


  Community get community => _community != null ? _community : getCommunity();
  bool get loading => _cvm.loading || _uvm.loading;
  String get error => _cvm.error; // TODO mjf: concat errors for all global models


  Community getCommunity() {
    if (_community != null) {
      return _community;
    }
    _community = _cvm.getCommunityById(_communityId);
    return _community;
  }


  void updateMemberStatus() async {
    getCommunity(); // ensure _community is available

    if (_community.isMember) {
      try {
        await _ucvm.leaveCommunity(_uvm.user.id, _communityId);
        _community.isMember = false;
        _community.members -= 1;
      } catch (err) {
        print(err.toString());
      }
    } else {
      try {
        await _ucvm.joinCommunity(_uvm.user.id, _communityId);
        _community.isMember = true;
        _community.members += 1;
      } catch (err) {
        print(err.toString());
      }
    }
    // update community detail to render new member state
    notifyListeners();
  }
}
