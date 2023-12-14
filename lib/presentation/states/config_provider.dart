import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manjaro_hello/domain/config_model.dart';

class ConfigProvider extends StateNotifier<ConfigModel> {
  ConfigProvider(ConfigModel config_model) : super(config_model);

  changeLanguaje(String languaje) {
    state = state.copyWith(saved_languaje: languaje);
  }
}
