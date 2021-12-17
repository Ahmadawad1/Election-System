import 'package:http/http.dart' as http;

class Candidate {
  String? name;
  int? id;
  int? nationalID;
  String? email;
  String? bio;
  int? location;
  int? gender;
  int? age;
  int? nationality;
  String? image;
  int? status;
  int? isVoted;
  int? candidID;

  Candidate({
    this.id,
    this.nationalID,
    this.name,
    this.age,
    this.email,
    this.location,
    this.bio,
    this.gender,
    this.image,
    this.status,
    this.nationality,
    this.isVoted,
    this.candidID,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      nationalID: json['NationalID'],
      id: json['ID'],
      name: json['Name'],
      email: json['Email'],
      image: json['Image'],
      location: json['Location'],
      nationality: json['Nationality'],
      gender: json['Gender'],
      status: json['Status'],
      age: json['Age'],
      isVoted: json['IsVoted'],
      candidID: json['CandidID'],
    );
  }
}
