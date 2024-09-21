// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_base_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemBaseModelCWProxy {
  ItemBaseModel id(int? id);

  ItemBaseModel name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemBaseModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemBaseModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemBaseModel call({
    int? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemBaseModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemBaseModel.copyWith.fieldName(...)`
class _$ItemBaseModelCWProxyImpl implements _$ItemBaseModelCWProxy {
  const _$ItemBaseModelCWProxyImpl(this._value);

  final ItemBaseModel _value;

  @override
  ItemBaseModel id(int? id) => this(id: id);

  @override
  ItemBaseModel name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemBaseModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemBaseModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemBaseModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ItemBaseModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $ItemBaseModelCopyWith on ItemBaseModel {
  /// Returns a callable class that can be used as follows: `instanceOfItemBaseModel.copyWith(...)` or like so:`instanceOfItemBaseModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemBaseModelCWProxy get copyWith => _$ItemBaseModelCWProxyImpl(this);
}
