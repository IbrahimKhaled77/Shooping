

class favoritesModlesGet {
  late bool status;
  String? message;
  late Data  data;



  favoritesModlesGet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =  new Data.fromJson(json['data']) ;
  }


}

class Data {
  int? currentPage;
  late List<Datauser> data=[] ;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;



  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((v) {
      data.add(new Datauser.fromJson(v));
    });
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }


}

class Datauser {
  late int id;
  late Product product;



  Datauser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = new Product.fromJson(json['product']) ;
  }


}

class Product {
 late int id;
 dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}



