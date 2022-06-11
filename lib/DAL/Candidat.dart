 
class Candidat{
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
  String contrat='';
  String contratName='';
  String certificat='';
  String certificatName='';
  String tarif = '';
  String paid = '';
  int status = 0;


  Candidat(
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
      this.contrat='',
      this.contratName='',
      this.certificatName='',
      this.certificat='',
      this.tarif='',
      this.paid='',
      this.status=0,
      
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
      "cniRecto": cniRecto, 
      "cniVerso": cniVerso, 
      "contrat": contrat,  
    };
  }
 
  factory Candidat.fromJson(Map<String, dynamic> json) {
    return Candidat(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      school_name: json["school_name"],
      birthdate: json["birthdate"],
      phoneNo: json["phoneNo"],
      sexe: json["sexe"],
      cni: json["cni"],
      photo: json["photo"], 
      cniRecto: json["cniRecto"], 
      cniVerso: json["cniVerso"], 
      contrat: json["contrat"],  
    );
  }


  @override
  String toString() {
    return 'Candidat{ name: $name, email: $email, school_name: $school_name, birthdate: $birthdate, phoneNo: $phoneNo, sexe: $sexe, cni: $cni, photo: $photo, photoName: $photoName, cniRecto: $cniRecto, cniRectoName: $cniRectoName, cniVerso: $cniVerso, cniVersoName: $cniVersoName, contrat: $contrat, certificatName: $certificatName, tarif: $tarif, paid: $paid, status: $status }';
  }


}