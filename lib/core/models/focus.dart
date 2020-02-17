class Focus {
  final String _id;
  final String _imperativeMessage;


  Focus({
    String id,
    String imperativeMessage,
  }) :
    _id = id,
    _imperativeMessage = imperativeMessage;


  static Focus fromJSON(Map<String, dynamic> json) {
    return Focus(
      id: json['id'].toString(),
      imperativeMessage: json['imperativeMessage'],
    );
  }
}
