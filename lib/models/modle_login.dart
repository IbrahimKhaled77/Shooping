

class ModelsLogin{
 late  bool status;
   String? message;
 late UserData? data;


  ModelsLogin.formJson(Map<String,dynamic>Json){
    status=Json['status'];
    message=Json['message'];
    data=Json['data']!=null ?UserData.formJson(Json['data']) : null;
  }


}


class UserData{
  late int id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;


   UserData.formJson(Map<String,dynamic>Json){
     id=Json['id'];
     name=Json['name'];
     email=Json['email'];
     phone=Json['phone'];
     image=Json['image'];
     points=Json['points'];
     credit=Json['credit'];
     token=Json['token'];

   }

}