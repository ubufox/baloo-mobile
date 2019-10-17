class Community {
  final String name;
  final String members;
  final String location;
  final String bannerImage;
  final String about;

  Community(
    this.name,
    this.members,
    this.location,
    this.bannerImage,
    this.about,
  );

  String getName() {
    return '$name';
  }

  String getMembers() {
    return '$members';
  }

  String getLocation() {
    return '$location';
  }

  String getBanner() {
    return '$bannerImage';
  }

  String getAbout() {
    return '$about';
  }
}
