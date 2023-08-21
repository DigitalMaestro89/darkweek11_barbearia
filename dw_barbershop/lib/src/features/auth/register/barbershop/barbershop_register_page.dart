import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/messages.dart';

class BarbershopRegisterPage extends StatefulWidget {
  const BarbershopRegisterPage({super.key});

  @override
  State<BarbershopRegisterPage> createState() => _BarbershopRegisterPageState();
}

class _BarbershopRegisterPageState extends State<BarbershopRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cradastrar estabelecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SimpleDialogOption(
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
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
            const Align(
              alignment: Alignment.centerLeft,
              child: WeekdaysPanel(),
            ),
            const SizedBox(height: 24),
            const SizedBox(
              height: 178,
              child: Placeholder(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56)),
              onPressed: () {
                switch (formKey.currentState?.validate()) {
                  case null || false:
                    Messages.showError('Formulário invalido', context);
                  case true:
                  //userRegisterVM.register(
                  //    name: nameEC.text,
                  //    email: emailEC.text,
                  //    password: passwordEC.text);
                }
              },
              child: const Text('CADASTRAR ESTABELECIMENTO'),
            )
          ]),
        ),
      ),
    );
  }
}
