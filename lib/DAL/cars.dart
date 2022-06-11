class Cars {
  int id = 0;
  String brand = '';
  String version = '';
  String engine = '';
  String color = '';
  String matricule = '';
  String kilometrage = '';
  String status = '0';
  String created_at = '';
  String updated_at = ''; 
  String photo = '';
  String photoName = '';
  int school_id = 0;

  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      id:json["id"],
      brand: json["brand"]??'',
      version: json["version"]??'',
      engine: json["engine"]??'',
      color: json["color"]??'',
      matricule: json["matricule"]??'',
      kilometrage: json["kilometrage"]??'', 
      status: json["status"],
      created_at: json["created_at"]??'',
      updated_at: json["updated_at"]??'', 
      photo: json["photo"]??'',
      photoName: json["photoName"]??'',
      school_id: json["school_id"]??0,
    );
  }

  Cars(
      {this.id=0,
      this.brand='',
      this.version='',
      this.engine='',
      this.color='',
      this.matricule='',
      this.kilometrage='', 
      this.status='0',
      this.created_at='',
      this.updated_at='',
      this.photo='',
      this.photoName='',
      this.school_id=0,
       });
      


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "brand": brand,
      "version": version,
      "engine": engine,
      "color": color,
      "matricule": matricule,
      "kilometrage": kilometrage, 
      "status": status,
      "created_at": created_at,
      "updated_at": updated_at, 
      "photo": photo,
      "photoName": photoName,
      "school_id": school_id,
    };
  }

  @override
  String toString() {
    return 
  'Cars{id: $id, brand: $brand,version:$version, engine: $engine, color: $color, matricule: $matricule, kilometrage: $kilometrage, status: $status, created_at: $created_at, updated_at: $updated_at}';
  }
}
