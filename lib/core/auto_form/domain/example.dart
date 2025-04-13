/*
The following is a sample form for editing a company

class EditCompanyFormModal extends LongFormModal {
  EditCompanyFormModal(Company company):super(
    title: 'Edit company',
    inputs: [
      FormInput(
        initialValue: company.name,
        label: 'Name',
      ),
      FormInput.email(
        initialValue: company.email,
        label: 'Email',
      ),
      FormInput.dropdown(
        initialValue: company.timezone,
        values: Timezone.values,
      ),
      FormInput.text(
        initialValue: '',
        name: 'name',
        validators: [],
      ),
      FormInput.custom(
        initialValue: '',
        name: 'name',
        validate: (value){
          return null;
        },
        build: (context){
          return SomeWidget(
            onChanged: (value){
              context.read<FormBloc>().add(
                OnInputEvent(value),
              );
            }
          );
        },
      ),
    ],
    submitHook:(name, email, timezone){
      sl<CompanyRepository>().createCompany(
        name: inputs.name.value,
        email: inputs.email.value,
        timezone: inputs.timezone.value,
      );
    },
  );
}
*/
