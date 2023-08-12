import 'dart:convert';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  var system_version = "fgt".obs;
  var is_first = true.obs;
  var is_last = false.obs;
  var valid_repo = false.obs;
  var skip_text = true.obs;
  var soft_index = 0.obs;
  var search_bar_visible = false.obs;
  var saved_languaje = "Español".obs;
  var launch_startup = true.obs;
  TextEditingController repo_controller = TextEditingController();

  get_config() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      launch_startup.value = prefs.getBool('launch_startup')!;
    } catch (e) {
      await prefs.setBool('launch_startup', true);
    }
    try {
      saved_languaje.value = prefs.getString('saved_languaje')!;
    } catch (e) {
      await prefs.setString('saved_languaje', "Español");
    }
  }

  get_system_version() async {
    File file = new File('/etc/lsb-release');
    String content = await file.readAsString();
    List<String> list_content = content.split("=");
    system_version.value =
        "${list_content[2].split("\n")[0]} ${list_content[3].split("\n")[0]}";

    print(system_version);
  }

  change_launch_startup(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('launch_startup', value);
  }

  change_saved_languaje(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_languaje', value);
  }

  initialize() async {
    await get_system_version();
    get_config();

    return 0;
  }
}
