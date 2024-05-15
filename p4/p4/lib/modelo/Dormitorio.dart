
class Dormitorio{
  int id = 0;
  String dormitorio="";
  
  Dormitorio(String dor){
    dormitorio=dor;
  }

  String toString(){
    return dormitorio;
  }

  factory Dormitorio.fromJson(Map<String, dynamic> jsonRes) {
    String des = jsonRes['tipo_casa'] as String;
    int idRes = jsonRes['id'] as int;

    Dormitorio dorm = Dormitorio(des);
    dorm.setId(idRes);

    return dorm;
  }

  void setId(int i){
    id=i;
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'descripcion' : dormitorio,
    };
  }
}