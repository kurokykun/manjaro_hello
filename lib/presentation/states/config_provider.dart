import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manjaro_hello/domain/app_data_model.dart';
import 'package:manjaro_hello/domain/config_model.dart';

class ConfigProvider extends StateNotifier<ConfigModel> {
  ConfigProvider(ConfigModel config_model) : super(config_model);

  changeLanguaje(String languaje) {
    state = state.copyWith(saved_languaje: languaje);
  }

  filterList(String filter) {
    List<Category> new_modified_list =
        List<Category>.from(state.original_app_list).where((element) {
      List aux = element.apps;
      return aux
          .any((app) => app.name.toLowerCase().contains(filter.toLowerCase()));
    }).toList();
    state = state.copyWith(modified_app_list: new_modified_list);
  }
}
