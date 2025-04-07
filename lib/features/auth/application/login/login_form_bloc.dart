import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supa_liquid/core/models/email/email.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/password/password.dart';
import '../../data/auth.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';
part 'login_form_bloc.freezed.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc(Auth auth) : super(LoginFormState.initial()) {
    on<LoginFormEvent>((event, emit) async {
      if (state.submissionInProgress) return;
      await event.map(
        onEmailInput: (event) {
          emit(state.copyWith(email: event.input));
        },
        onPasswordInput: (event) {
          emit(state.copyWith(password: event.input));
        },
        onSubmit: (event) async {
          emit(state.copyWith(showErrors: true));
          if (state.email.isInValid || state.password.isInValid) return;
          emit(state.copyWith(submissionInProgress: true));
          await auth.signInWithEmailAndPassword(
            email: state.email,
            password: state.password,
          );
          emit(state.copyWith(submissionInProgress: false));
        },
      );
    });
  }
}
