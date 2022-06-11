 
class Admin{
  int id =0;
  String name ='';
  String email ='';
 
  int status = 0;


  Admin(
      {this.id=0,
      this.name='',
      this.email='',
      this.status=0,
      
});



  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email, 
    };
  }
 
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json["id"],
      name: json["name"],
      email: json["email"], 
    );
  }


  @override
  String toString() {
    return 'Admin{ name: $name, email: $email, status: $status }';
  }


}