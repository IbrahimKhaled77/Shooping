class ModelHome{
  late bool status;
 late ModelDataHome data;

  ModelHome.formJson(Map<String,dynamic>Json){
    status=Json['status'];
    data=  ModelDataHome.formJson(Json['data']);
  }

}


class ModelDataHome{
  List<ModelBanners>banners=[];
  List<ModelProducts>products=[];

  ModelDataHome
      .formJson(Map<String,dynamic>Json){
    Json['banners'].forEach((element){
      banners.add(ModelBanners.formJson(element));
    });
    Json['products'].forEach((element){
      products.add(ModelProducts.formJson(element));
    });
  }

}

class ModelBanners{
 late int id;
  late String image;

  ModelBanners.formJson(Map<String,dynamic>Json){
    id=Json['id'];
    image=Json['image'];

  }
}

class ModelProducts{
 late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String?image;
  String?name;
  bool?inFavorites;
  bool?inCart;

  ModelProducts.formJson(Map<String,dynamic>Json){
    id=Json['id'];
    price=Json['price'];
    oldPrice=Json['old_price'];
    discount=Json['discount'];
    image=Json['image'];
    name=Json['name'];
    inFavorites=Json['in_favorites'];
    inCart=Json['in_cart'];

  }

}
