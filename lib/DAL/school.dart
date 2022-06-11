class School {
  int id = 0;
  String school_name = '';
  String name = '';
  String address = '';
  String city = '';
  String description = '';
  String logo = '';
  String phoneNo = '';
  String experience = '';
  String founded = '';
  String workingTime = '';
  int status = 0;
  String created_at = '';
  String updated_at = '';
  String email = '';

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id:json["id"],
      school_name: json["school_name"]??'',
      name: json["name"]??'',
      address: json["address"]??'',
      city: json["city"]??'',
      description: json["description"]??'',
      logo: json["logo"]??'',
      phoneNo: json["phoneNo"]??'',
      experience: json["experience"]??'',
      founded: json["founded"]??'',
      workingTime: json["workingTime"]??'',
      status: json["status"],
      created_at: json["created_at"]??'',
      updated_at: json["updated_at"]??'',
      email: json["email"]??'',
    );
  }

  School(
      {this.id=0,
      this.school_name='',
      this.name='',
      this.address='',
      this.city='',
      this.description='',
      this.logo='',
      this.phoneNo='',
      this.experience='',
      this.founded='',
      this.workingTime='',
      this.status=0,
      this.created_at='',
      this.updated_at='',
      this.email='', });


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "school_name": school_name,
      "name": name,
      "address": address,
      "city": city,
      "description": description,
      "logo": logo,
      "phoneNo": phoneNo,
      "experience": experience,
      "founded": founded,
      "workingTime": workingTime,
      "status": status,
      "created_at": created_at,
      "updated_at": updated_at,
      "email": email, 
    };
  }

  @override
  String toString() {
    return 
  'School{id: $id, school_name: $school_name,name:$name, address: $address, city: $city, description: $description, logo: $logo, phoneNo: $phoneNo, experience: $experience, founded: $founded, workingTime: $workingTime, status: $status, created_at: $created_at, updated_at: $updated_at}';
  }
}
