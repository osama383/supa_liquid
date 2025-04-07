import 'package:dart_mappable/dart_mappable.dart';
import 'package:supa_liquid/core/models/email/email.dart';
import 'package:supa_liquid/core/models/firestore_document.dart';

import 'permission.dart';

part 'user.mapper.dart';

@MappableClass()
class User extends FirestoreDocument with UserMappable {
  final EmailAddress email;
  final Set<Permission> permissions;

  const User({required super.id, required this.email})
    : permissions = const {
        Permission.trips,
        Permission.customers,
        Permission.assets,
      };
}
