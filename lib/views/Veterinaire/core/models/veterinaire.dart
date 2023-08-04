
import 'package:cloud_firestore/cloud_firestore.dart';

class Veterinaire {
  String? _uid;
  String? _name;
  String? _phone;
  String? _genre;
  String? _password;
  String? _email;
  String? _address; 
  String? _created_at;

  Veterinaire(
      {  String? uid,
      required String? name,
      required String? phone,
      required String? genre,
      required String? password,
      required String? email,
      required String? address, 
      required String? created_at}) {
    _uid = uid;
    _name = name;
    _phone = phone;
    _genre = genre;
    _password = password;
    _email = email;
    _address = address; 
    _created_at = created_at;
  }

  String? get uid => _uid;
  String? get name => _name;
  String? get phone => _phone;
  String? get genre => _genre;
  String? get password => _password;
  String? get email => _email;
  String? get address => _address; 
  String? get created_at => _created_at;

  set uid(String? uid) => _uid = uid;
  set name(String? name) => _name = name;
  set phone(String? phone) => _phone = phone;
  set genre(String? genre) => _genre = genre;
  set password(String? password) => _password = password;
  set email(String? email) => _email = email;
  set address(String? address) => _address = address; 
  set created_at(String? created_at) => _created_at = created_at;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'password': password,
      'email': email,
      'genre': genre,
      'address': address, 
      'created_at': created_at,
    };
  }

  Veterinaire.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _name = res['name'],
        _phone = res['phone'],
        _password = res['password'],
        _genre = res['genre'],
        _email = res['email'],
        _address = res['address'], 
        _created_at = res['created_at'];

  Veterinaire.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _uid = doc.id,
        _name = doc.data()!["name"],
        _phone = doc.data()!["phone"],
        _genre = doc.data()!["genre"],
        _password = doc.data()!["password"],
        _email = doc.data()!["email"],
        _address = doc.data()!["address"], 
        _created_at = doc.data()!["created_at"];
}
