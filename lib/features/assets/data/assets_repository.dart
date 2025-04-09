import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/models/assets/assets.dart';
import '../../../core/models/failure/failure.dart';
import '../../../injection.dart';
import '../../auth/data/auth.dart';

@singleton
class AssetsRepository {
  final Supabase supabase;

  AssetsRepository(this.supabase);

  Future<Either<Failure, Depot>> createDepot(String name) async {
    final response =
        await supabase.client
            .from('depot')
            .insert({'name': name, 'company_id': sl<Auth>().company.id})
            .select()
            .single();
    return right(DepotMapper.fromMap(response));
  }

  Future<Either<Failure, List<Depot>>> fetchDepots({
    required String name,
  }) async {
    final response = await supabase.client
        .from('depot')
        .select('id, name, company(id)');
    return right(response.map((e) => DepotMapper.fromMap(e)).toList());
  }
}
