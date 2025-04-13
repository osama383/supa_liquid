import 'package:uuid/uuid.dart';

class FormValue<T extends Object?> {
  String id;
  T value;

  final String? Function(T? value) validate;
  String? selfValidate() {
    return validate(value);
  }

  bool get isValid => validate(value) == null;
  bool get isInValid => !isValid;

  FormValue._(this.id, this.value, this.validate);
  FormValue(this.value, this.validate) : id = Uuid().v4();

  FormValue<T?> copyWith(T? newValue) {
    return FormValue._(id, newValue, validate);
  }
}
