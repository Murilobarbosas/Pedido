// ignore_for_file: file_names

import 'package:lista_produtos/Shared/restClient.dart';
import 'package:get/get.dart';

class HomeBindinds implements Bindings {
  @override
  void dependencies() {
    Get.put(RestClient());
  }
}
