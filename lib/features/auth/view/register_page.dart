import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/bloc/credential/credential_bloc.dart';
import 'package:madang/features/auth/view/widgets/button_submit.dart';
import 'widgets/button_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    userNameC.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text('Register',
              style: AppText.text18.copyWith(fontWeight: FontWeight.bold))),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            buttonField(context, 'Name', controller: userNameC,
                validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter userName';
              }
              return null;
            }),
            buttonField(context, 'Email', controller: emailC, validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter Email';
              }
              return null;
            }),
            buttonField(context, 'Password',
                isObsecure: true,
                suffixIcon: const Icon(Icons.remove_red_eye),
                controller: passC, validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter password';
              }
              return null;
            }),
            const SizedBox(height: 20),
            submit(),
          ]),
        ));
  }

  Widget submit() {
    return BlocConsumer<CredentialBloc, CredentialState>(
      listener: (context, state) {
        if (state.status == GlobalStateStatus.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state.status == GlobalStateStatus.succes) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RoutesName.login, (route) => false);
        }
      },
      builder: (context, state) {
        if (state.status == GlobalStateStatus.loading) {
          return const CircularProgressIndicator();
        }

        return buttonSubmit(
          context,
          'Register',
          'Login',
          text: 'Already have an account? ',
          buttonOnTap: () {
            if (!_formKey.currentState!.validate()) {
              return;
            } else {
              if (userNameC.text.isNotEmpty &&
                  emailC.text.isNotEmpty &&
                  passC.text.isNotEmpty) {
                context.read<CredentialBloc>().add(OnRegisterEvent(
                    username: userNameC.text,
                    email: emailC.text,
                    password: passC.text));
              }
            }
          },
          textOnTap: () {
            Navigator.of(context).pushNamed(RoutesName.login);
          },
        );
      },
    );
  }
}
