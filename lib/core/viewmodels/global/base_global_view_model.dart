// Services
import 'package:baloo/core/services/graphql.dart';

// Models
import 'package:baloo/core/models/stream_types/client_available.dart';
import 'package:baloo/core/viewmodels/base_view_model.dart';



class BaseGlobalViewModel extends BaseViewModel {
  GraphQLService _gqls;
  bool _isReady = false;



  BaseGlobalViewModel({ GraphQLService gqls }) {
    _gqls = gqls;

    _gqls.hasClient.listen((ClientAvailable hasClient) => initialize(hasClient));
  }


  GraphQLService get gqls => _gqls;
  bool get isReady => _isReady;

  void set isReady(bool r) {
    _isReady = r;
  }

  // should be overriden by extending class
  void initialize(ClientAvailable hasClient) async {
    if (hasClient.value == false) {
      _isReady = false;
    } else {
      _isReady = true;
    }
  }
}
