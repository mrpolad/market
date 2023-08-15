class Category {
  final int? cid;
  final String? cname;
  final String? cphoto;

  Category({
    required this.cid,
    required this.cname,
    required this.cphoto,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        cid: json['cid'],
        cname: json['cname'],
        cphoto: json['cphoto'],
      );

  Map<String, dynamic> toJson() => {
        'cid': cid,
        'cname': cname,
        'cphoto': cphoto,
      };
}

class Number {
  final String number;
  final String smsCode;

  Number({required this.number, required this.smsCode});

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        number: json['number'],
        smsCode: json['smscode'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'smscode': smsCode,
      };
}

class Search {
  final String name;
  final String photo;

  Search({required this.name, required this.photo});

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        name: json['name'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photo,
      };
}

class CarouselP {
  final String? photoc;

  CarouselP({
    required this.photoc,
  });

  factory CarouselP.fromJson(Map<String, dynamic> json) => CarouselP(
        photoc: json['photoc'],
      );

  Map<String, dynamic> toJson() => {
        'photoc': photoc,
      };
}

class Product {
  final int id;
  final String name;
  final int price;
  final String photo;
  final int categoryId;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.photo,
    required this.categoryId,
  });

  String get formattedPrice => "$price";

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        photo: json['photo'],
        categoryId: json['categoryId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'photo': photo,
        'categoryId': categoryId,
      };
}
