class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Format JSON
  toJson() {
    return {'Name': name, 'Values': values};
  }

  /// Map JSON orienté document snapshot de Firebase vers Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    // Si le document est vide, retourner un modèle vide

    final data = document;
    if (data.isEmpty) return ProductAttributeModel();



    // Créer une nouvelle instance de ProductAttributeModel à partir des données du document
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}