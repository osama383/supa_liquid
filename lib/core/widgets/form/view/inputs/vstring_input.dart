import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auto_form/controller/bloc/form_bloc.dart';

class TextInput extends StatelessWidget {
  final String? initial;
  final String inputId;
  final String labelText;

  const TextInput(
    this.initial, {
    super.key,
    required this.inputId,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: initial,
          autovalidateMode:
              state.showErrors
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          decoration: InputDecoration(labelText: labelText),
          onChanged:
              (value) => context.read<FormBloc>().add(
                OnFormInputEvent(inputId, value),
              ),
          validator: (_) {
            final formValue = state.input(inputId);
            return formValue.selfValidate();
          },
        );
      },
    );
  }
}
