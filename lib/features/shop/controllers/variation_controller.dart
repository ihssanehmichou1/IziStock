import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:izistock/features/shop/controllers/home_controller.dart';
import 'package:izistock/features/shop/controllers/product/images_controller.dart';
import '../models/product_model.dart';
import '../models/product_variation_model.dart';

class VariationController extends GetxController{
  static VariationController get instance =>Get.find();

  //variable
  RxMap seletedAttributes ={}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  //Select attribute
  void onAttributeSelected(ProductModel product,attributeName,attributeValue){
    //===
    final selectedAttributes = Map<String,dynamic>.from(this.seletedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.seletedAttributes[attributeName] = attributeValue;
    final selectedVariation =
    product.productVariations!.firstWhere((variation) => _isSameAttributeValues(variation.attributeValues,selectedAttributes),
        orElse: () => ProductVariationModel.empty()
    );
    //show the selected variation
    if(selectedVariation.image.isNotEmpty){
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
  }
  //check if selected attribute matches any variation attribute
  bool _isSameAttributeValues(Map<String,dynamic> variationAttributes, Map<String,dynamic> selectedAttributes){
    //if selected attribute
    if(variationAttributes.length != selectedAttributes.length)return false;
    for(final key in variationAttributes.keys){
      if(variationAttributes.length != selectedAttributes.length)return false;
    }
    return true;
  }

  //check Attribute
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations,String attributeName){
    final availableVariationsAttributeValues = variations
        .where((variation) =>
    variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock >0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationsAttributeValues;
  }
  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  //check product
  void getProductVariationStockStatus(){
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock': 'Out Stock';
  }
  // Rest selected attributes
  void resetSelectedAttributes(){
    seletedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}