import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/bloc/credential/credential_bloc.dart';
import 'package:madang/features/auth/view/widgets/button_field.dart';
import 'package:madang/features/auth/view/widgets/button_submit.dart';

import '../../../common/routes/routes_name.dart';
import '../../../constant/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
            style: AppText.text18.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buttonField(context, 'Email', controller: emailC,
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              }),
              buttonField(context, 'Password',
                  controller: passC,
                  isObsecure: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              }),
              const SizedBox(height: 20),
              submit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget submit() {
    return BlocConsumer<CredentialBloc, CredentialState>(
        builder: (context, state) {
      if (state.status == GlobalStateStatus.loading) {
        return const CircularProgressIndicator();
      }

      return buttonSubmit(context, 'Login', 'Register',
          text: 'Doesn\'t have an account? ', buttonOnTap: () {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
            context
                .read<CredentialBloc>()
                .add(OnLoginEvent(email: emailC.text, password: passC.text));
          }
        }
      }, textOnTap: () {
        Navigator.of(context).pushNamed(RoutesName.register);
      });
    }, listener: (context, state) {
      if (state.status == GlobalStateStatus.error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      } else if (state.status == GlobalStateStatus.succes) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
        Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesName.mainNavigation, (route) => false);
      }
    });
  }
}
