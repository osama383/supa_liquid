part of 'form_bloc.dart';

sealed class FormEvent {}

class OnFormInputEvent extends FormEvent {
  final String id;
  final Object? value;

  OnFormInputEvent(this.id, this.value);
}

class OnFormSubmitEvent extends FormEvent {}
