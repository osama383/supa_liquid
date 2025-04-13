import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supa_liquid/core/models/value_object/value_object.dart';

import '../../../models/failure/failure.dart';
import '../../domain/form_input/form_value.dart';

part 'form_event.dart';
part 'form_state.dart';
part 'form_bloc.mapper.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc({
    required List<FormValue> inputs,
    required Future<void> Function(List<FormValue> values) submitHook,
  }) : super(FormState.initial(inputs, false)) {
    on<FormEvent>((event, emit) async {
      switch (event) {
        case OnFormInputEvent():
          final index = state.inputs.indexWhere((e) => e.id == event.id);
          if (index == -1) return;
          final input = state.inputs[index];
          final inputs = List<FormValue>.from(state.inputs)
            ..[index] = input.copyWith(event.value);
          emit(state.copyWith(inputs: inputs));
          return;

        case OnFormSubmitEvent():
          emit(state.copyWith(showErrors: true));
          if (state.inputs.any((e) => e.isInValid)) return;
          emit(state.copyWith(submissionInProgress: true));
          await submitHook(state.inputs);
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
