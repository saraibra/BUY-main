import 'package:buyit/logic/controllers/settings_controller.dart';
import 'package:buyit/utils/my_string.dart';
import 'package:buyit/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);


   final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (_) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: languageSettings,
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "Language".tr,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            english,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: ene,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            arabic,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: ara,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            france,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: frf,
                        ),
                      ],
                      value: controller.langLocal,
                      onChanged: (value){
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                    ),
                  ),
                ),
              ],
            ),
        );
  }
}
