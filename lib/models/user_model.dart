import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? id;
  String? lastName;
  String? name;
  String? rut;
  String? email;

  UserModel({
    this.id,
    this.lastName,
    this.name,
    this.rut,
    this.email,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //   id: json["id"],
  //   lastName: json["lastName"],
  //   name: json["name"],
  //   rut: json["rut"],
  // );


  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "lastName": lastName,
  //   "name": name,
  //   "rut": rut,
  // };


  UserModel.fromSnapshot(DataSnapshot snap) {
    id = (snap.value as dynamic)['id'];
    lastName = (snap.value as dynamic)['lastName'];
    name = (snap.value as dynamic)['name'];
    rut = (snap.value as dynamic)['rut'];
    email = (snap.value as dynamic)['email'];
  }
}
