import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/models/company/company.dart';
import '../data/public_repository.dart';

part 'public_event.dart';
part 'public_state.dart';
part 'public_bloc.mapper.dart';

class PublicBloc extends Bloc<PublicEvent, PublicState> {
  PublicBloc(PublicRepository repo) : super(PublicState(companies: [])) {
    on<PublicEvent>((event, emit) async {
      switch (event) {
        case PublicEventStarted():
          final companies = await repo.getCompanies();
          emit(state.copyWith(companies: companies));

        case PublicEventCreateCompany():
          await repo.createCompany();
          add(PublicEventStarted());
      }
    });
  }
}
