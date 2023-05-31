

class SearchModlesSCreeen {
  late bool status;
  late Data  data;



  SearchModlesSCreeen.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =  new Data.fromJson(json['data']) ;
  }


}

class Data {
  int? currentPage;
  late List<Product> data ;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null nextPageUrl;
  String? path;
  int? perPage;
  Null prevPageUrl;
  int? to;
  int? total;



  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data=[];
    json['data'].forEach((v) {
      data.add(new Product.fromJson(v));
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



class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? in_favorites;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    in_favorites = json['in_favorites'];
  }


}

