class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Créer une fonction vide pour nettoyer le code
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  /// Convertir en JSON
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  /// Map JSON orienté document snapshot de Firebase vers Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    // Si le document est vide, retourner une instance vide
    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['Id'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
      description: data['Description'],
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}