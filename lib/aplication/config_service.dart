import 'dart:io';

import 'package:manjaro_hello/domain/config_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  loadConfig() async {
    ConfigModel config = const ConfigModel();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      config =
          config.copyWith(launch_startup: prefs.getBool('launch_startup')!);
    } catch (e) {
      await prefs.setBool('launch_startup', true);
    }
    try {
      config =
          config.copyWith(saved_languaje: prefs.getString('saved_languaje')!);
    } catch (e) {
      //Obetner lenguaje predeterminado
      await prefs.setString('saved_languaje', "English");
    }
    File file = new File('/etc/lsb-release');
    String content = await file.readAsString();
    List<String> list_content = content.split("=");
    config = config.copyWith(
        system_version:
            "${list_content[2].split("\n")[0]} ${list_content[3].split("\n")[0]}");

    return config;
  }

  changeLanguaje(String languaje) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_languaje', languaje);
  }
}
