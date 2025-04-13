import 'package:flutter/material.dart' hide FormState;
import 'package:supa_liquid/core/auto_form/domain/form_input/form_input.dart';
import 'package:supa_liquid/core/auto_form/domain/form_input/long_form_modal.dart';
import 'package:supa_liquid/core/models/value_object/value_object.dart';
import 'package:supa_liquid/core/scaffold/nav/nav.dart';

import '../../../core/scaffold/view/base_scaffold.dart';
import '../../auth/data/auth.dart';

class HomePage extends StatelessWidget {
  final Auth auth;
  const HomePage(this.auth, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      auth,
      title: 'Home',
      selectedItem: NavItem.home,
      body: Center(
        child: Column(
          children: [
            Text(auth.company.name),
            FilledButton(
              onPressed: () {
                LongFormModal(
                  theTitle: 'Title',
                  inputs: [
                    InputBuilder.vstring(VString.empty(), label: 'Name'),
                  ],
                  submitHook: (e) async {
                    print(e);
                  },
                ).show();
              },
              child: Text('form'),
            ),
          ],
        ),
      ),
    );
  }
}

// class FlutterForm {
//   final List<Input<ValueObject>> inputs;
//   final void Function(List<Input<ValueObject>> inputs) onSubmit;

//   FlutterForm({required this.inputs, required this.onSubmit});

//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FormBloc(inputs: inputs, submitHook: onSubmit),
//       child: BlocBuilder<FormBloc, FormState>(
//         builder: (context, state) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 16),
//               ...state.inputs.map((e) => e.build(context)),
//               const SizedBox(height: 16),
//               FilledButton(
//                 onPressed: () {
//                   context.read<FormBloc>().add(OnFormSubmitEvent());
//                 },
//                 child: const Text('Save'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
