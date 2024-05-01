import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  // Variable pour suivre l'état de chargement
  final isLoading = false.obs;

  // Variable pour suivre l'index actuel du carrousel
  final carousalCurrentIndex = 0.obs;

  // Référentiel de catégories
  final CategoryRepository _categoryRepository = Get.find();

  get allCategories => null;

  get featuredCategories => null;

  // Fonction pour mettre à jour l'index du carrousel
  void updateCarousalIndex(int index) {
    carousalCurrentIndex.value = index;
  }

  // Fonction pour récupérer les bannières
  Future<void> fetchBanners() async {
    try {
      // Afficher le chargeur pendant le chargement des catégories
      isLoading.value = true;

      // Récupérer les catégories depuis la source de données (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Mettre à jour la liste des catégories
      allCategories.assignAll(categories);

      // Mettre à jour les catégories en vedette
      featuredCategories.assignAll(
        allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList(),
      );
    } catch (e) {
      // Afficher une notification d'erreur en cas d'échec
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Arrêter l'affichage du chargeur
      isLoading.value = false;
    }
  }
}