import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:izistock/features/shop/models/product_attribute_model.dart';
import 'package:izistock/features/shop/models/product_variation_model.dart';

import '../../../common/widgets/brands/brand_model.dart';

class ProductModel {
  String id;
  String sku;
  String title;
  int stock;
  double price;
  DateTime? date;
  List<String> ? images;
  String thumbnail;
  double salePrice;
  bool isFeatured;
  String categoryId;
  BrandModel brand;
  String description;
  String productType;
  List<ProductAttributeModel> productAttributes;
  List<ProductVariationModel> productVariations;

  ProductModel({
    required this.id,
    required this.sku,
    required this.title,
    required this.stock,
    required this.price,
    required this.images,
    required this.thumbnail,
    this.salePrice =0.0,
    required this.isFeatured,
    required this.categoryId,
    required this.brand,
    required this.description,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
  });

  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    stock: 0,
    price: 0,
    thumbnail: '',
    productType: '', sku: '', images: [], isFeatured: true, categoryId: '', brand: BrandModel.empty(), description: '', productAttributes: [], productVariations: [],
  );
  toJson() {
    return{
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
      isFeatured: data['IsFeatured'] ?? false,
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
      isFeatured: data['IsFeatured'] ?? false,
    );
  }
}