import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manjaro_hello/domain/app_data_model.dart';

part 'config_model.freezed.dart';
part 'config_model.g.dart';

@freezed
class ConfigModel with _$ConfigModel {
  const factory ConfigModel({
    @Default('') String system_version,
    @Default(true) bool is_first,
    @Default(false) bool is_last,
    @Default(false) bool valid_repo,
    @Default('') String saved_languaje,
    @Default(true) bool launch_startup,
    @Default(false) bool show_scroll_button,
    @Default('') String repo_controller_text,
    @Default('') String search_controller_text,
    @Default([]) List<Category> original_app_list,
    @Default([]) List<Category> modified_app_list,
    //eliminar este ultimo
    @Default({}) Map<String, bool> selected_app_map,
  }) = _ConfigModel;

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);
}
