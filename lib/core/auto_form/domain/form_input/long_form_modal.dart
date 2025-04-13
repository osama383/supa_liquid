import 'package:flutter/material.dart';
import 'package:supa_liquid/core/auto_form/domain/form_input/form_value.dart';
import 'package:supa_liquid/core/routes/routes.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';
import 'package:supa_liquid/core/widgets/modal_builder/modal_builder.dart';

import '../../controller/bloc/form_bloc.dart';
import 'form_input.dart';

class LongFormModal extends LongModal<FormBloc> {
  final String theTitle;
  final FormBloc _bloc;
  final List<FormInput> inputs;

  LongFormModal({
    required this.theTitle,
    required this.inputs,
    required Future<void> Function(List<FormValue> inputs) submitHook,
  }) : _bloc = FormBloc(
         values: inputs.map((e) => e.value).toList(),
         submitHook: submitHook,
       );

  @override
  FormBloc? get bloc => _bloc;

  @override
  Widget content(BuildContext context) {
    return Column(children: [...inputs.map((e) => e.build(context))]);
  }

  @override
  Stream<bool> get isBusyStream =>
      bloc!.stream.map((e) => e.submissionInProgress);

  @override
  LongModalConfigutation configure(BuildContext context) {
    final labels = context.localizationLabels;
    return LongModalConfigutation(
      bottomWidget: DefaultBottomWidget(
        child: Row(
          children: [
            FilledButton(
              onPressed: () {
                bloc!.add(OnFormSubmitEvent());
              },
              child: Text(labels.save),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget title(BuildContext context) {
    return Text(theTitle);
  }

  @override
  void popWithValue(BuildContext context) {
    return goRouter.pop();
  }
}
