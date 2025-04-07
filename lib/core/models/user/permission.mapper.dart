// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'permission.dart';

class PermissionMapper extends EnumMapper<Permission> {
  PermissionMapper._();

  static PermissionMapper? _instance;
  static PermissionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PermissionMapper._());
    }
    return _instance!;
  }

  static Permission fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Permission decode(dynamic value) {
    switch (value) {
      case r'trips':
        return Permission.trips;
      case r'customers':
        return Permission.customers;
      case r'reports':
        return Permission.reports;
      case r'sales':
        return Permission.sales;
      case r'assets':
        return Permission.assets;
      case r'settings':
        return Permission.settings;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Permission self) {
    switch (self) {
      case Permission.trips:
        return r'trips';
      case Permission.customers:
        return r'customers';
      case Permission.reports:
        return r'reports';
      case Permission.sales:
        return r'sales';
      case Permission.assets:
        return r'assets';
      case Permission.settings:
        return r'settings';
    }
  }
}

extension PermissionMapperExtension on Permission {
  String toValue() {
    PermissionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Permission>(this) as String;
  }
}
