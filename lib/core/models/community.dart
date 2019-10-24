class Community {
  final int _id;
  final String _name;
  final String _members;
  final String _location;
  final String _bannerImage;
  final String _about;

  Community(
    this._id,
    this._name,
    this._members,
    this._location,
    this._bannerImage,
    this._about,
  );

  int get id => _id;
  String get name => _name;
  String get members => _members;
  String get location => _location;
  String get bannerImage => _bannerImage;
  String get about => _about;
}
