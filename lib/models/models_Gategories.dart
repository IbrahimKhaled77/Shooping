class ModelGategor {
  bool? status;
 late ModelsDataGategor data;

  ModelGategor.formjson(Map<String,dynamic>Json){
    status=Json['status'];
    data=ModelsDataGategor.formJson(Json['data']);
  }

}

class ModelsDataGategor {
  int? current_page;
late  List<ModelData2>data=[];

  ModelsDataGategor.formJson(Map<String,dynamic>Json){
    current_page=Json['current_page'];
    Json['data'].forEach((element){
      data.add(ModelData2.fromJson(element));
    });
  }



}

class ModelData2{
 late int id;
 late String image;
 late String name;

  ModelData2.fromJson(Map<String,dynamic>Json){
    id=Json['id'];
    image=Json['image'];
    name=Json['name'];
  }

}