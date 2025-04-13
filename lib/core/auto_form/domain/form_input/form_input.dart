import 'package:flutter/material.dart';
import 'package:supa_liquid/core/widgets/form/view/inputs/vstring_input.dart';

import '../../../models/value_object/value_object.dart';
import 'form_value.dart';

class FormInput {
  final FormValue value;
  final Widget Function(BuildContext context) build;

  FormInput({required this.value, required this.build});
}

class InputBuilder {
  static FormInput vstring(VString value, {required String label}) {
    final formValue = FormValue<String?>(value.valueAsString, (String? input) {
      final result = VString.validate(input);
      return result.fold((_) => '', (_) => null);
    });

    return FormInput(
      value: formValue,
      build: (context) {
        return TextInput(
          formValue.value,
          inputId: formValue.id,
          labelText: label,
        );
      },
    );
  }
}
