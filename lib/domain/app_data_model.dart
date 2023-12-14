import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String name,
    required String icon,
    required String description,
    required List<App> apps,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class App with _$App {
  const factory App({
    required String name,
    required String icon,
    required String description,
    required String pkg,
    required List<dynamic> extra,
    required bool selected,
  }) = _App;

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}
