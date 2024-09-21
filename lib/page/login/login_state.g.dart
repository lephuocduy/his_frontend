// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState loginStatus(LoginStatus? loginStatus);

  LoginState departmentList(List<ItemBaseModel>? departmentList);

  LoginState roomList(List<ItemBaseModel>? roomList);

  LoginState account(String? account);

  LoginState password(String? password);

  LoginState department(ItemBaseModel? department);

  LoginState room(ItemBaseModel? room);

  LoginState isLoading(bool isLoading);

  LoginState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    LoginStatus? loginStatus,
    List<ItemBaseModel>? departmentList,
    List<ItemBaseModel>? roomList,
    String? account,
    String? password,
    ItemBaseModel? department,
    ItemBaseModel? room,
    bool? isLoading,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState loginStatus(LoginStatus? loginStatus) =>
      this(loginStatus: loginStatus);

  @override
  LoginState departmentList(List<ItemBaseModel>? departmentList) =>
      this(departmentList: departmentList);

  @override
  LoginState roomList(List<ItemBaseModel>? roomList) =>
      this(roomList: roomList);

  @override
  LoginState account(String? account) => this(account: account);

  @override
  LoginState password(String? password) => this(password: password);

  @override
  LoginState department(ItemBaseModel? department) =>
      this(department: department);

  @override
  LoginState room(ItemBaseModel? room) => this(room: room);

  @override
  LoginState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  LoginState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? loginStatus = const $CopyWithPlaceholder(),
    Object? departmentList = const $CopyWithPlaceholder(),
    Object? roomList = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? department = const $CopyWithPlaceholder(),
    Object? room = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
      loginStatus: loginStatus == const $CopyWithPlaceholder()
          ? _value.loginStatus
          // ignore: cast_nullable_to_non_nullable
          : loginStatus as LoginStatus?,
      departmentList: departmentList == const $CopyWithPlaceholder()
          ? _value.departmentList
          // ignore: cast_nullable_to_non_nullable
          : departmentList as List<ItemBaseModel>?,
      roomList: roomList == const $CopyWithPlaceholder()
          ? _value.roomList
          // ignore: cast_nullable_to_non_nullable
          : roomList as List<ItemBaseModel>?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      department: department == const $CopyWithPlaceholder()
          ? _value.department
          // ignore: cast_nullable_to_non_nullable
          : department as ItemBaseModel?,
      room: room == const $CopyWithPlaceholder()
          ? _value.room
          // ignore: cast_nullable_to_non_nullable
          : room as ItemBaseModel?,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
