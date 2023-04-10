import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_section_23/pages/home_screen.dart';

import '../bloc/register_bloc.dart';
import '../models/account_model.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  void _initial() {
    context.read<RegisterBloc>().getAccount();
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Register Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Name'),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name field not allowed empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Email'),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email field not allowed empty';
                      }

                      if (!EmailValidator.validate(value)) {
                        return 'Must be a valid email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Phone'),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone field not allowed empty';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.password),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password field not allowed empty';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        var isLogin = state.isLogin;
                        if (isLogin!) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.route,
                            (route) => false,
                          );
                        }
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();

                        if (!isValid) return;

                        final account = AccountModel(
                          _nameController.text,
                          _emailController.text,
                          _phoneController.text,
                          _phoneController.text,
                        );

                        var result = await context
                            .read<RegisterBloc>()
                            .createAccount(account);

                        if (mounted) {}

                        if (result) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.route,
                            (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
