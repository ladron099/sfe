import 'dart:convert';

import 'package:permis/DAL/Candidat.dart';
import 'package:permis/DAL/moniteur.dart';

import '../DAL/cars.dart';
import '../const/vars.dart';
import '../DAL/school.dart';
import 'package:http/http.dart' as http;

class 
ApiFunctions {
  login(String email, String password) async {
    try {
      var response = await http.post(Uri.parse("${link}login"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({"email": email, "password": password})).timeout(Duration(seconds: 10));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  addSchool(School sc, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}schools"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "fullname": sc.name,
            "school_name": sc.school_name,
            "email": sc.email,
            "city": sc.city,
            "adress": sc.address,
            "phone": sc.phoneNo,
            "password": "123456789",
            "description":"pas de description valable"
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  addCar(Cars sc, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}cars"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
             'brand' : sc.brand,
            'version' : sc.version,
            'engine' : sc.engine,
            'color' : sc.color,
            'matricule' : sc.matricule,
            'kilometrage' : sc.kilometrage,
            'school_id' : sc.school_id,
            'photo' : sc.photo,
            'photoName' : sc.photoName,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  addMoniteur(Moniteur mn,String id, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}coachs"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
                'name' : mn.name,
                'email' : mn.email,
                'phoneNo' : mn.phoneNo,
                'school_id' : id,
                'password' : '123456789',
                'birthdate' : mn.birthdate,
                'sexe' : mn.sexe=='Homme'?'1':'2',
                'cni' : mn.cni,
                'numeroCarteMoniteur' : mn.numeroCarteMoniteur,
                'cniRecto' : mn.cniRecto,
                'cniRectoName' : mn.cniRectoName,
                'cniVerso' : mn.cniVerso,
                'cniVersoName' : mn.cniVersoName,
                'carteMoniteur' : mn.carteMoniteur,
                'carteMoniteurName' : mn.carteMoniteurName,
                'photo' : mn.photo,
                'photoName' : mn.photoName,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  test(String image,String imageName, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}test"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
                'photo' : image,
                'photoName' : imageName
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  editSchool(String token,School sc,String password) async {
    try {
      var response = await http.put(Uri.parse("${link}schools/${sc.id}"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "fullname": sc.name,
            "school_name": sc.school_name,
            "city": sc.city,
            "adress": sc.address,
            "phone": sc.phoneNo,
            "password":password,
            "description": sc.description
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  loggout(String token) async {
    try {
      var response = await http.post(Uri.parse("${link}logout"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({"email": 'email', "password": 'password'}));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getSchool(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getInscription(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}inscriptions"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getCars(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}cars"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
    modifyPassword(String token,int id, String previousPassword,
      String newPassword) async {
    try {
      var response =
          await http.put(Uri.parse("${link}updatePassword/$id"),
              headers: {
                "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
              },
              body: jsonEncode({ 
                "previousPassword": previousPassword,
                "newPassword": newPassword,
              }));
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getAll(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}users"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getCandidat(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}candidats"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getUser(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}me"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getCandidatSchool(String token,int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/candidats"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getCoachSchool(String token,int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/coachs"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  getCarsSchool(String token,int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/cars"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getCoach(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}coachs"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  searchSchool(String token, String name) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/search/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  searchCoachId(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}coachs/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  searchCandidatId(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}candidats/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  updateStatus(String token, int id,int status) async {
     try {
      var response = await http.put(Uri.parse("${link}users/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
         "status": status
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  updateAdmin(String token, int id,String name,String email) async {
     try {
      var response = await http.put(Uri.parse("${link}admin/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
         "name": name,
         "email":email
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  updateInscription(String token, int id,int status) async {
     try {
      var response = await http.put(Uri.parse("${link}inscriptions/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
         "status": status
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  searchSchoolid(String token, int name) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  deleteSchool(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}schools/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  deleteCandidat(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}candidats/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  deleteCar(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}cars/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  deleteCoach(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}coachs/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  deleteUser(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}users/$name"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  addCandidat(Candidat mn, String schoolId, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}candidats"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
                'name' : mn.name,
                'email' : mn.email,
                'phoneNo' : mn.phoneNo,
                'school_id' : schoolId,
                'password' : '123456789',
                'birthdate' : mn.birthdate,
                'sexe' : mn.sexe=='Homme'?'1':'2',
                'cni' : mn.cni,
                'contrat' : mn.contrat,
                'contratName':mn.contratName,
                'cniRecto' : mn.cniRecto,
                'cniRectoName' : mn.cniRectoName,
                'cniVerso' : mn.cniVerso,
                'cniVersoName' : mn.cniVersoName,
                'certificat' : mn.certificat,
                'certificatName' : mn.certificatName,
                'photo' : mn.photo,
                'photoName' : mn.photoName,
                'tarif':mn.tarif,
                'paid': mn.paid,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }


  }
  editCandidat(Candidat mn, String token) async {
    try {
      var response = await http.put(Uri.parse("${link}candidats/${mn.id}"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
                'name' : mn.name, 
                'phoneNo' : mn.phoneNo, 
                'password' : '123456789',
                'birthdate' : mn.birthdate,
                'sexe' : mn.sexe=='Homme'?'1':'2',
                'cni' : mn.cni, 
                'paid': mn.paid,
                'photo' : '',
                'photoName' :'',
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }


  }
}
