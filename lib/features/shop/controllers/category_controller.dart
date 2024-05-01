import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/repositories/categories/category_model.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../../../features/shop/screens/all_products/product_repository.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = CategoryRepository();
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      // Afficher un loader pendant le chargement des catégories
      isLoading.value = true;
      // Récupérer les catégories depuis la source de données (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();
      // Mettre à jour la liste des catégories
      allCategories.assignAll(categories);
      // Filtrer les catégories en vedette
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      // Afficher une Snackbar d'erreur en cas d'échec
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Supprimer le Loader
      isLoading.value = false;
    }
  }

  /// Charger les données de la catégorie sélectionnée
  Future<List<CategoryModel>> getSubCategories({required String categoryId}) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      // Afficher une Snackbar d'erreur en cas d'échec
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Obtenir les produits de la catégorie
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      // Afficher une Snackbar d'erreur en cas d'échec
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
