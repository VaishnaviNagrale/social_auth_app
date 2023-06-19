class UserDetailsModelFacebook {
  String? displyName;
  String? email;
  String? photoUrl;

  UserDetailsModelFacebook({this.displyName, this.email, this.photoUrl});

   UserDetailsModelFacebook.fromJson(Map<String, dynamic> json) {
    displyName = json['displyName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = Map<String, dynamic>();

    mapData['displyName'] = this.displyName;
    mapData['email'] = this.email;
    mapData['photoUrl'] = this.photoUrl;

    return mapData;
  }
}
