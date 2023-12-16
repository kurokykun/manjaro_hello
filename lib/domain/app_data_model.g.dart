// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      name: json['name'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      apps: (json['apps'] as List<dynamic>)
          .map((e) => App.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
      'apps': instance.apps,
    };

_$AppImpl _$$AppImplFromJson(Map<String, dynamic> json) => _$AppImpl(
      name: json['name'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      pkg: json['pkg'] as String,
      extra: json['extra'] as List<dynamic>,
    );

Map<String, dynamic> _$$AppImplToJson(_$AppImpl instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
      'pkg': instance.pkg,
      'extra': instance.extra,
    };
