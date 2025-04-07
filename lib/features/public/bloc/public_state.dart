part of 'public_bloc.dart';

@MappableClass()
class PublicState with PublicStateMappable {
  final List<Company> companies;

  PublicState({required this.companies});
}
