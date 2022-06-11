 
class Moniteur{
  int id =0;
  String name ='';
  String email ='';
  String school_name ='';
  String birthdate ='';
  String phoneNo = '';
  String sexe ='';
  String cni='';
  String photo='';
  String photoName='';
  String cniRecto='';
  String cniRectoName='';
  String cniVerso='';
  String cniVersoName='';
  String carteMoniteur='';
  String carteMoniteurName='';
  String numeroCarteMoniteur='';
  String status = '';


  Moniteur(
      {this.id=0,
      this.name='',
      this.email='',
      this.school_name='',
      this.birthdate='',
      this.phoneNo='',
      this.sexe='',
      this.cni='',
      this.photo='',
      this.photoName='',
      this.cniRecto='',
      this.cniRectoName='',
      this.cniVerso='',
      this.cniVersoName='',
      this.carteMoniteur='',
      this.carteMoniteurName='',
      this.numeroCarteMoniteur='',
      this.status='',

      
      });



  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "school_name": school_name,
      "birthdate": birthdate,
      "phoneNo": phoneNo,
      "sexe": sexe,
      "cni": cni,
      "photo": photo,
      "status": status,
    };
  }
 
  factory Moniteur.fromJson(Map<String, dynamic> json) {
    return Moniteur(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      school_name: json["school_name"],
      birthdate: json["birthdate"],
      phoneNo: json["phoneNo"],
      sexe: json["sexe"],
      cni: json["cni"],
      photo: json["photo"], 
      status: json["status"],

    );
  }


  @override
  String toString() {
    return 'Moniteur{ name: $name, email: $email, school_name: $school_name, birthdate: $birthdate, phoneNo: $phoneNo, sexe: $sexe, cni: $cni, photo: $photo, photoName: $photoName, cniRecto: $cniRecto, cniRectoName: $cniRectoName, cniVerso: $cniVerso, cniVersoName: $cniVersoName}';
  }


}