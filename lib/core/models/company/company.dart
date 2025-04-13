import 'package:dart_mappable/dart_mappable.dart';

part 'company.mapper.dart';

@MappableClass()
class Company with CompanyMappable {
  final String id;
  final String name;
  // final List<Depot> depots;

  Company({required this.id, required this.name});
}
