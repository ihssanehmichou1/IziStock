import 'dart:async';

import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';
import '../../screens/all_products/product_repository.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value =true;
      //fetch the products
      final products = await productRepository.getFeaturedProducts();
      //Assign the product
      fetchFeaturedProducts.assignAll(products);
    }catch(e) {
      TLoaders.errorSnackBar(title:'Oh Snap',message:e.toString());
    }finally{
      isLoading.value =false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async{
    try{
      //Fetch the product
      final products = await productRepository.getFeaturedProducts();
      //Assign the product
      featuredProducts.assignAll(products);
      return products;
    }catch(e) {
      TLoaders.errorSnackBar(title:'Oh Snap',message:e.toString());
      return [];

    }
  }
  //Get the product price or price range for variations
  Object gatProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variations exist, return the simple price or salle price
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }else{
    //calculate the smallest and largest price among all variations
    for(var variation in product.productVariations!){
    //Determine the price to consider (sale price if available atherwise regular price)
    double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;
    //Update the smallest and largest price
    if(priceToConsider < smallestPrice){
    smallestPrice = priceToConsider;

    }
    if(priceToConsider > largestPrice){
    largestPrice = priceToConsider;
    }
    }
    //if small and largest price are the same return a single price
    if(smallestPrice == largestPrice){
    return smallestPrice.toString();
    }else{
    return '$smallestPrice - \$$largestPrice';
    }
    }
  }
  //Calculate the DisCount Perentage
  String? calculateSalePerentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double perentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return perentage.toStringAsFixed(0);
  }
  //Check product Stack Status
  String getProductStackStatus(int stock){
    return stock > 0 ? 'In stock' : 'Out stock';
  }

}