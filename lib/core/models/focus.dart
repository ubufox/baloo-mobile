class Focus {
  final String _id;
  final String _imperativeMessage;


  Focus({
    String id,
    String imperativeMessage,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage;


  String get id => _id;
  String get imperativeMessage => _imperativeMessage;


  static Focus fromJSON(Map<String, dynamic> json) {
    return Focus(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
    );
  }
}
