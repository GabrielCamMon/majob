class RestProfile {
  final int uuidUser;
  final String name;
  final String speciality;
  final String type;
  final String about;

  RestProfile({this.uuidUser, this.name, this.speciality, this.type, this.about});

  factory RestProfile.fromJson(Map<String, dynamic> json) {
    return RestProfile(
      uuidUser: json['userId'],
      name: json['id'],
      speciality: json['title'],
      type:json['title'],
      about:json['about']
    );
  }
}

