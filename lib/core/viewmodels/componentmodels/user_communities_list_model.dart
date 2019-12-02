// Models
import 'package:baloo/core/viewmodels/base_view_model.dart';
import 'package:baloo/core/viewmodels/global/user_communities_view_model.dart';
import 'package:baloo/core/models/user_community.dart';


class UserCommunitiesListModel extends BaseViewModel {
  UserCommunitiesViewModel _ucvm;


  UserCommunitiesListModel({ UserCommunitiesViewModel ucvm }) : _ucvm = ucvm;


  List<UserCommunity> get communities => _ucvm.communities;
  int get count => _ucvm.count;
  bool get loading => _ucvm.loading;
  String get errors => _ucvm.error;
}
