// This service will hold data that is accesible
// at a global level the app

final DEFAULT_EXPIRATION_SECONDS = 1 * 60 * 60; // 1 hour

final String USER_KEY = 'user';
final String USER_COMMUNITIES_KEY = 'usercommunities';
final String COMMUNITIES_LIST_KEY = 'communitieslist';
final String COMMUNITIES_BY_ID_KEY = 'communitiesbyid';


class Data {
  DateTime _expiresAt;
  dynamic _value;

  Data({
    DateTime expiresAt,
    dynamic value,
  }) :
    _expiresAt = expiresAt,
    _value = value;

  DateTime get expiresAt => _expiresAt;
  dynamic get value => _value;
}


class GlobalDataService {
  Map<String, Data> global;
  Map<String, List<Function>> listeners;


  GlobalDataService() {
    global = {};
    listeners = {};
  }


  void upsert(String key, dynamic value, [DateTime expires]) {
    DateTime one_hour_from_now = DateTime.now().add(
      Duration(seconds: DEFAULT_EXPIRATION_SECONDS)
    );

    Data newValue = Data(
      expiresAt: expires == null ? one_hour_from_now : expires,
      value: value,
    );

    global[key] = newValue;

    if (listeners[key] != null) {
      listeners[key].forEach((l) =>
        l(value)
      );
    }
  }

  void observe(String key, Function listener) {
    if (listeners[key] != null) {
      listeners[key].insert(listeners[key].length, listener);
    } else {
      listeners[key] = [listener];
    }
  }

  dynamic getVal(String key) {
    if (global[key] != null) {
      if (global[key].expiresAt.isAfter(DateTime.now())) {
        return global[key].value;
      }

      throw('Data expired');
    }

    throw('Value ${key} does not exist');
  }

  void delete(String key) {
    global[key] = null;
  }

  void clearAll() {
    global = null;
    listeners = null;
  }
}
