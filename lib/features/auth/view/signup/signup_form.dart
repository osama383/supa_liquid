import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supa_liquid/core/widgets/wip_overlay.dart';
import 'package:supa_liquid/features/auth/application/signup/signup_bloc.dart';
import 'package:supa_liquid/injection.dart';

import '../../../../core/models/email/email.dart';
import '../../../../core/models/password/password.dart';
import '../../application/auth_page/auth_page_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(sl()),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Stack(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _EmailInput(),
                SizedBox(height: 16),
                _PasswordInput(),
                SizedBox(height: 16),
                _Submit(),
                SizedBox(height: 16),
                _GoToSignin(),
              ],
            ),
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                return WipOverlay(state.submissionInProgress);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          autovalidateMode:
              state.showErrors
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          onChanged: (value) {
            context.read<SignupBloc>().add(
              SignupEvent.onEmailInput(EmailAddress(value)),
            );
          },
          validator: (_) {
            return state.email.value.fold(
              (failure) => failure.when(
                invalidFormat: (_) => 'Invalid format',
                empty: () => 'required',
              ),
              (_) => null,
            );
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          autovalidateMode:
              state.showErrors
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          decoration: const InputDecoration(labelText: 'Password'),
          onChanged: (value) {
            context.read<SignupBloc>().add(
              SignupEvent.onPasswordInput(Password(value)),
            );
          },
          validator: (_) {
            return state.password.value.fold(
              (failure) => failure.when(tooShort: (_) => 'Too short'),
              (_) => null,
            );
          },
        );
      },
    );
  }
}

class _Submit extends StatelessWidget {
  const _Submit();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<SignupBloc>().add(const SignupEvent.onSubmit());
      },
      child: const Text('Submit'),
    );
  }
}

class _GoToSignin extends StatelessWidget {
  const _GoToSignin();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthPageBloc>().add(
          const AuthPageEvent.onModeChange(AuthMode.signIn),
        );
      },
      child: const Text('Go to login'),
    );
  }
}
