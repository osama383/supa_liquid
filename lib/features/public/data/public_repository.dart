import 'package:faker/faker.dart' hide Company;
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/models/company/company.dart';

@singleton
class PublicRepository {
  final Supabase supabase;

  PublicRepository(this.supabase);

  Future<List<Company>> getCompanies() async {
    final response = await supabase.client.from('company').select('name');

    return response.map((e) => CompanyMapper.fromMap(e)).toList();
  }

  Future<void> createCompany() async {
    final company = Company(id: Uuid().v4(), name: faker.company.name());
    await supabase.client.from('company').insert(company.toMap());
  }
}
