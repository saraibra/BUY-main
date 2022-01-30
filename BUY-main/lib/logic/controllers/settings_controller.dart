import 'dart:ui';

import 'package:buyit/utils/my_string.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  //Language
  @override
  void onInit() async{
    super.onInit();
    langLocal = await getLanguage;
  }

void saveLanguage(String lang)async{
 await storage.write('lang', lang);
}

//getLang.
Future<String> get getLanguage async{
  if(storage.read('lang')==null){
    return ene;
  }
  return await storage.read('lang');
}

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
