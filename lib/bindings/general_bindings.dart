import 'package:get/get.dart';
import 'package:izistock/common/widgets/network_manager.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}