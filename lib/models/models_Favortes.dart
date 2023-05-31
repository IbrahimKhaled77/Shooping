class  ModelChangeFavortes{
   late bool? status;
   String? message;

  ModelChangeFavortes.formJson(Map<String,dynamic>Json){
    status=Json['status'];
    message=Json['message'];
  }



}