part of 'form_bloc.dart';

@MappableClass()
class FormState with FormStateMappable {
  final List<FormValue> inputs;
  final bool isEditing;
  final bool showErrors;
  final bool submissionInProgress;
  final Option<Either<Failure, Unit>> resultOption;

  FormState({
    required this.inputs,
    required this.isEditing,
    required this.showErrors,
    required this.submissionInProgress,
    required this.resultOption,
  });

  factory FormState.initial(List<FormValue> inputs, bool isEditing) {
    return FormState(
      inputs: inputs,
      isEditing: isEditing,
      showErrors: false,
      submissionInProgress: false,
      resultOption: none(),
    );
  }

  FormValue input(String id) {
    return inputs.singleWhere((e) => e.id == id);
  }
}
