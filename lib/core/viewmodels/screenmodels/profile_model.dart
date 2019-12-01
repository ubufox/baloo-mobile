import 'package:baloo/core/viewmodels/base_view_model.dart';

// Models
import 'package:baloo/core/models/user.dart';
import 'package:baloo/core/viewmodels/global/user_view_model.dart';


class ProfileModel extends BaseViewModel {
  User _user;
  UserViewModel _uvm;


  // TODO mjf: add List<UserGoals>
  ProfileModel({ UserViewModel uvm, }) : _uvm = uvm;


  // forward User View Model values to screen
  User get user => _uvm.user;
  // TODO mjf: add accomplishments List<UserGoals>
  bool get loading => _uvm.loading; // or accomplishments loading
  String get errors => _uvm.error; // concat with accomplishments loading

}
