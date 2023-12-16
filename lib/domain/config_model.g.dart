// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelImpl _$$ConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$ConfigModelImpl(
      system_version: json['system_version'] as String? ?? '',
      is_first: json['is_first'] as bool? ?? true,
      is_last: json['is_last'] as bool? ?? false,
      valid_repo: json['valid_repo'] as bool? ?? false,
      saved_languaje: json['saved_languaje'] as String? ?? '',
      launch_startup: json['launch_startup'] as bool? ?? true,
      show_scroll_button: json['show_scroll_button'] as bool? ?? false,
      repo_controller_text: json['repo_controller_text'] as String? ?? '',
      search_controller_text: json['search_controller_text'] as String? ?? '',
      original_app_list: (json['original_app_list'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      modified_app_list: (json['modified_app_list'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selected_app_map:
          (json['selected_app_map'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as bool),
              ) ??
              const {},
    );

Map<String, dynamic> _$$ConfigModelImplToJson(_$ConfigModelImpl instance) =>
    <String, dynamic>{
      'system_version': instance.system_version,
      'is_first': instance.is_first,
      'is_last': instance.is_last,
      'valid_repo': instance.valid_repo,
      'saved_languaje': instance.saved_languaje,
      'launch_startup': instance.launch_startup,
      'show_scroll_button': instance.show_scroll_button,
      'repo_controller_text': instance.repo_controller_text,
      'search_controller_text': instance.search_controller_text,
      'original_app_list': instance.original_app_list,
      'modified_app_list': instance.modified_app_list,
      'selected_app_map': instance.selected_app_map,
    };
