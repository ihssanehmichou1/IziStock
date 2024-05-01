import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:izistock/features/shop/controllers/home_controller.dart';

import '../../models/product_model.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();

  //variables
  RxString selectedProductImage = ''.obs;
  //get all images from product and variations
  List<String> getAllProductImages(ProductModel product){
    //use set to add unique images only
    Set<String> images = {};
    //load all images
    images.add(product.thumbnail);
    //Assign Thumbnails as selected image
    selectedProductImage.value = product.thumbnail;
    //get all images
    if(product.images != null){
      images.addAll(product.images as Iterable<String>);
    }
    //Get all images from product variations if not null
    if(product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation)=>variation.image));
    }
    return images.toList();
  }
  // show images popup
  void showEnlargedImage(String image){
    Get.to(
        fullscreenDialog: true,
            ()=> Dialog.fullscreen(

        )
    );
  }
}