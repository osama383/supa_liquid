import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/failure/failure.dart';
import '../../domain/form_input/form_value.dart';

part 'form_event.dart';
part 'form_state.dart';
part 'form_bloc.mapper.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc({
    required List<FormValue> values,
    required Future<void> Function(List<FormValue> values) submitHook,
  }) : super(FormState.initial(values, false)) {
    on<FormEvent>((event, emit) async {
      switch (event) {
        case OnFormInputEvent():
          final index = state.values.indexWhere((e) => e.id == event.id);
          if (index == -1) return;
          final input = state.values[index];
          final inputs = List<FormValue>.from(state.values)
            ..[index] = input.copyWith(event.value);
          emit(state.copyWith(inputs: inputs));
          return;

        case OnFormSubmitEvent():
          emit(state.copyWith(showErrors: true));
          if (state.values.any((e) => e.isInValid)) return;
          emit(state.copyWith(submissionInProgress: true));
          await submitHook(state.values);
          emit(
            state.copyWith(
              submissionInProgress: false,
              resultOption: some(right(unit)),
            ),
          );
          return;
      }
    });
  }
}
