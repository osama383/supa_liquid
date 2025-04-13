part of 'form_bloc.dart';

@MappableClass()
class FormState with FormStateMappable {
  final List<FormValue> values;
  final bool isEditing;
  final bool showErrors;
  final bool submissionInProgress;
  final Option<Either<Failure, Unit>> resultOption;

  FormState({
    required this.values,
    required this.isEditing,
    required this.showErrors,
    required this.submissionInProgress,
    required this.resultOption,
  });

  factory FormState.initial(List<FormValue> values, bool isEditing) {
    return FormState(
      values: values,
      isEditing: isEditing,
      showErrors: false,
      submissionInProgress: false,
      resultOption: none(),
    );
  }

  FormValue input(String id) {
    return values.singleWhere((e) => e.id == id);
  }
}
