// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'form_bloc.dart';

class FormStateMapper extends ClassMapperBase<FormState> {
  FormStateMapper._();

  static FormStateMapper? _instance;
  static FormStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FormStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FormState';

  static List<FormValue<Object?>> _$inputs(FormState v) => v.inputs;
  static const Field<FormState, List<FormValue<Object?>>> _f$inputs =
      Field('inputs', _$inputs);
  static bool _$isEditing(FormState v) => v.isEditing;
  static const Field<FormState, bool> _f$isEditing =
      Field('isEditing', _$isEditing, key: r'is_editing');
  static bool _$showErrors(FormState v) => v.showErrors;
  static const Field<FormState, bool> _f$showErrors =
      Field('showErrors', _$showErrors, key: r'show_errors');
  static bool _$submissionInProgress(FormState v) => v.submissionInProgress;
  static const Field<FormState, bool> _f$submissionInProgress = Field(
      'submissionInProgress', _$submissionInProgress,
      key: r'submission_in_progress');
  static Option<Either<Failure, Unit>> _$resultOption(FormState v) =>
      v.resultOption;
  static const Field<FormState, Option<Either<Failure, Unit>>> _f$resultOption =
      Field('resultOption', _$resultOption, key: r'result_option');

  @override
  final MappableFields<FormState> fields = const {
    #inputs: _f$inputs,
    #isEditing: _f$isEditing,
    #showErrors: _f$showErrors,
    #submissionInProgress: _f$submissionInProgress,
    #resultOption: _f$resultOption,
  };

  static FormState _instantiate(DecodingData data) {
    return FormState(
        inputs: data.dec(_f$inputs),
        isEditing: data.dec(_f$isEditing),
        showErrors: data.dec(_f$showErrors),
        submissionInProgress: data.dec(_f$submissionInProgress),
        resultOption: data.dec(_f$resultOption));
  }

  @override
  final Function instantiate = _instantiate;

  static FormState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FormState>(map);
  }

  static FormState fromJson(String json) {
    return ensureInitialized().decodeJson<FormState>(json);
  }
}

mixin FormStateMappable {
  String toJson() {
    return FormStateMapper.ensureInitialized()
        .encodeJson<FormState>(this as FormState);
  }

  Map<String, dynamic> toMap() {
    return FormStateMapper.ensureInitialized()
        .encodeMap<FormState>(this as FormState);
  }

  FormStateCopyWith<FormState, FormState, FormState> get copyWith =>
      _FormStateCopyWithImpl<FormState, FormState>(
          this as FormState, $identity, $identity);
  @override
  String toString() {
    return FormStateMapper.ensureInitialized()
        .stringifyValue(this as FormState);
  }

  @override
  bool operator ==(Object other) {
    return FormStateMapper.ensureInitialized()
        .equalsValue(this as FormState, other);
  }

  @override
  int get hashCode {
    return FormStateMapper.ensureInitialized().hashValue(this as FormState);
  }
}

extension FormStateValueCopy<$R, $Out> on ObjectCopyWith<$R, FormState, $Out> {
  FormStateCopyWith<$R, FormState, $Out> get $asFormState =>
      $base.as((v, t, t2) => _FormStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FormStateCopyWith<$R, $In extends FormState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FormValue<Object?>,
      ObjectCopyWith<$R, FormValue<Object?>, FormValue<Object?>>> get inputs;
  $R call(
      {List<FormValue<Object?>>? inputs,
      bool? isEditing,
      bool? showErrors,
      bool? submissionInProgress,
      Option<Either<Failure, Unit>>? resultOption});
  FormStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FormStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FormState, $Out>
    implements FormStateCopyWith<$R, FormState, $Out> {
  _FormStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FormState> $mapper =
      FormStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FormValue<Object?>,
          ObjectCopyWith<$R, FormValue<Object?>, FormValue<Object?>>>
      get inputs => ListCopyWith($value.inputs,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(inputs: v));
  @override
  $R call(
          {List<FormValue<Object?>>? inputs,
          bool? isEditing,
          bool? showErrors,
          bool? submissionInProgress,
          Option<Either<Failure, Unit>>? resultOption}) =>
      $apply(FieldCopyWithData({
        if (inputs != null) #inputs: inputs,
        if (isEditing != null) #isEditing: isEditing,
        if (showErrors != null) #showErrors: showErrors,
        if (submissionInProgress != null)
          #submissionInProgress: submissionInProgress,
        if (resultOption != null) #resultOption: resultOption
      }));
  @override
  FormState $make(CopyWithData data) => FormState(
      inputs: data.get(#inputs, or: $value.inputs),
      isEditing: data.get(#isEditing, or: $value.isEditing),
      showErrors: data.get(#showErrors, or: $value.showErrors),
      submissionInProgress:
          data.get(#submissionInProgress, or: $value.submissionInProgress),
      resultOption: data.get(#resultOption, or: $value.resultOption));

  @override
  FormStateCopyWith<$R2, FormState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FormStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
