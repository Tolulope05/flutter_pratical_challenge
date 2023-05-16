class ProductsModel {
  bool? success;
  String? message;
  List<Data>? data;

  ProductsModel({this.success, this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;
  int? iV;
  List<Products>? products;

  Data(
      {this.sId,
        this.isActive,
        this.createdAt,
        this.name,
        this.description,
        this.shopemail,
        this.shopaddress,
        this.shopcity,
        this.userid,
        this.image,
        this.iV,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
    iV = json['__v'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['description'] = description;
    data['shopemail'] = shopemail;
    data['shopaddress'] = shopaddress;
    data['shopcity'] = shopcity;
    data['userid'] = userid;
    data['image'] = image;
    data['__v'] = iV;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  String? categories;
  String? subcate;
  String? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? colors;
  String? size;
  List<Images>? images;
  int? iV;
  bool? inWishlist;

  Products(
      {this.sId,
        this.onSale,
        this.salePercent,
        this.sold,
        this.sliderNew,
        this.sliderRecent,
        this.sliderSold,
        this.date,
        this.title,
        this.categories,
        this.subcate,
        this.shop,
        this.price,
        this.saleTitle,
        this.salePrice,
        this.description,
        this.colors,
        this.size,
        this.images,
        this.iV,
        this.inWishlist});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'];
    subcate = json['subcate'];
    shop = json['shop'];
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    colors = json['colors'];
    size = json['size'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    iV = json['__v'];
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['on_sale'] = onSale;
    data['sale_percent'] = salePercent;
    data['sold'] = sold;
    data['slider_new'] = sliderNew;
    data['slider_recent'] = sliderRecent;
    data['slider_sold'] = sliderSold;
    data['date'] = date;
    data['title'] = title;
    data['categories'] = categories;
    data['subcate'] = subcate;
    data['shop'] = shop;
    data['price'] = price;
    data['sale_title'] = saleTitle;
    data['sale_price'] = salePrice;
    data['description'] = description;
    data['colors'] = colors;
    data['size'] = size;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    data['in_wishlist'] = inWishlist;
    return data;
  }
}

class Images {
  String? sId;
  String? filename;
  String? url;

  Images({this.sId, this.filename, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filename = json['filename'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['filename'] = filename;
    data['url'] = url;
    return data;
  }
}
