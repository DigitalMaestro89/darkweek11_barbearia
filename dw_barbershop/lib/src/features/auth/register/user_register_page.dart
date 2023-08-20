// ignore_for_file: unused_local_variable

import 'dart:html';

import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/core/ui/helpers/messages.dart';
import 'package:dw_barbershop/src/features/auth/register/user_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVM = ref.watch(userRegisterVmProvider.notifier);

    ref.listen(userRegisterVmProvider, (_, state) { 
      switch(state) {
        case UserRegisterStateStatus.initial:
        case UserRegisterStateStatus.success:
        case UserRegisterStateStatus.error:
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(height: 20),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: nameEC,
                validator: Validatorless.required('Nome obrigatório'),
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail obrigatório'),
                  Validatorless.email('E-mail obrigatório')
                ]),
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: passwordEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha Obrigatório'),
                  Validatorless.min(6, 'Senha deve ter no minimo 6 caracteres'),
                ]),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirma Senha Obrigatório'),
                  Validatorless.compare(passwordEC, 'Senha diferente de confirma senha'),
                ]),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Confirmar Senha'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56)
                ),
                onPressed: () {
                  switch(formKey.currentState?.validate()) {
                    case null || false:
                      Messages.showError('Formulário invalido', context);
                    case true:
                      userRegisterVM.register(name: nameEC.text, email: emailEC.text, password: passwordEC.text);
                  }
                },
                child: const Text('CRIAR CONTA'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
