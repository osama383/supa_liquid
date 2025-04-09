import 'package:flutter/material.dart';
import 'package:supa_liquid/core/models/company/company.dart';
import 'package:supa_liquid/core/models/value_object/value_object.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';
import 'package:supa_liquid/core/widgets/form/view/form_modal/short_form_modal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/widgets/form/domain/input.dart';
import '../../../injection.dart';
import '../../auth/data/auth.dart';

class CreateCompanyPage extends StatelessWidget {
  const CreateCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = context.localizationLabels;
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Column(
        children: [
          Text('No company found'),
          FilledButton(
            onPressed: () {
              shortFormModal(
                title: 'Create company',
                inputs: [Input.vstring(VString(''), labelText: labels.name)],
                submitHook: (inputs) async {
                  try {
                    print(inputs);
                    final response =
                        await Supabase.instance.client
                            .from('company')
                            .insert(
                              Company(
                                id: Uuid().v4(),
                                name:
                                    (inputs.first.value as VString).getOrCrash,
                              ).toMap(),
                            )
                            .select()
                            .single();

                    sl<Auth>().companyUpdated(CompanyMapper.fromMap(response));

                    print(response);
                  } catch (e) {
                    print(e);
                  }
                },
              ).show();
            },
            child: Text('Create company'),
          ),
        ],
      ),
    );
  }
}
