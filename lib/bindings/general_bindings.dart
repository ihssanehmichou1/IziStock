import 'package:get/get.dart';
import 'package:izistock/features/personalization/controllers/address_controller.dart';
import 'package:izistock/features/shop/controllers/product/checkout_controller.dart';
import '../common/widgets/network_manager.dart';
import '../features/shop/controllers/variation_controller.dart';
class GeneralBindings extends Bindings{


  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());

  }
}