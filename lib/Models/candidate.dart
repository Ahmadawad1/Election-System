import 'package:http/http.dart' as http;

class Citizen {
  //TODO(Khalifa): Change the nationality and location to strings and the isVoted to boolean.
  //TODO: Change the gender to boolean and add a boolean for the authorization and delete the bio parameter.
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

  Citizen({
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

  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
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
