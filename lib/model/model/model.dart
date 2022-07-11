class ResponseModel {
  ResponseModel({
    required this.total,
    required this.limit,
    required this.skip,
    required this.data,
  });

  int total;
  int limit;
  int skip;
  List<ProductModel> data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        data: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.image,
    // required this.bulkPrice,
    // required this.vendorBulkPrice,
    // required this.vendeaseBulkPrice,
    required this.vendorPrice,
    required this.vendeasePrice,
    required this.marketPrice,
    required this.discountDeleted,
    required this.deleted,
    required this.name,
    required this.categoryId,
    required this.subCategoryId,
    required this.description,
    required this.discount,
    required this.weight,
    required this.weightUnit,
    required this.countryCode,
    required this.cityCode,
    required this.ownerType,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.categoryDetails,
  });

  String? id;
  String? image;
  // List<dynamic>? bulkPrice;
  // List<dynamic>? vendorBulkPrice;
  // List<dynamic>? vendeaseBulkPrice;
  int? vendorPrice;
  double? vendeasePrice;
  int? marketPrice;
  bool? discountDeleted;
  bool? deleted;
  String? name;
  String? categoryId;
  String? subCategoryId;
  String? description;
  Discount? discount;
  String? weight;
  String? weightUnit;
  String? countryCode;
  String? cityCode;
  String? ownerType;
  String? owner;
  String? createdAt;
  String? updatedAt;
  int? v;
  CategoryDetails? categoryDetails;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        image: json["image"],
        // bulkPrice: List<dynamic>.from(json["bulk_price"].map((x) => x)),
        // vendorBulkPrice:
        //     List<dynamic>.from(json["vendor_bulk_price"].map((x) => x)),
        // vendeaseBulkPrice:
        //     List<dynamic>.from(json["vendease_bulk_price"].map((x) => x)),
        vendorPrice: json["vendor_price"],
        vendeasePrice: json["vendease_price"].toDouble(),
        marketPrice: json["market_price"],
        discountDeleted: json["discount_deleted"],
        deleted: json["deleted"],
        name: json["name"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        description: json["description"],
        discount:json["discount"]==null?null: Discount.fromJson(json["discount"]),
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        countryCode: json["countryCode"],
        cityCode: json["cityCode"],
        ownerType: json["owner_type"],
        owner: json["owner"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        categoryDetails:json["category_details"]==null?null: CategoryDetails.fromJson(json["category_details"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        // "bulk_price": List<dynamic>.from(bulkPrice!.map((x) => x)),
        // "vendor_bulk_price": List<dynamic>.from(vendorBulkPrice!.map((x) => x)),
        // "vendease_bulk_price":
        //     List<dynamic>.from(vendeaseBulkPrice!.map((x) => x)),
        "vendor_price": vendorPrice,
        "vendease_price": vendeasePrice,
        "market_price": marketPrice,
        "discount_deleted": discountDeleted,
        "deleted": deleted,
        "name": name,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "description": description,
        "discount": discount?.toJson(),
        "weight": weight,
        "weight_unit": weightUnit,
        "countryCode": countryCode,
        "cityCode": cityCode,
        "owner_type": ownerType,
        "owner": owner,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "category_details": categoryDetails?.toJson(),
      };
}

class CategoryDetails {
  CategoryDetails({
    required this.name,
    required this.taxExempt,
    required this.discount,
    required this.subCategory,
  });

  String? name;
  bool? taxExempt;
  Discount? discount;
  String? subCategory;

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      CategoryDetails(
        name: json["name"],
        taxExempt: json["tax_exempt"],
        discount: json["discount"]==null?null:Discount.fromJson(json["discount"]),
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tax_exempt": taxExempt,
        "discount": discount?.toJson(),
        "sub_category": subCategory,
      };
}

class Discount {
  Discount({
    required this.discountType,
    required this.discountValue,
    required this.id,
  });

  String? discountType;
  int? discountValue;
  String? id;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "discount_type": discountType,
        "discount_value": discountValue,
        "_id": id,
      };
}
