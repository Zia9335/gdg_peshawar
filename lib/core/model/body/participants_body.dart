class Participant {
  String? sId;
  String? name;
  String? email;
  String? bio;
  int? iV;

  Participant({this.sId, this.name, this.email, this.bio, this.iV});

  Participant.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    bio = json['bio'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['__v'] = this.iV;
    return data;
  }
}
