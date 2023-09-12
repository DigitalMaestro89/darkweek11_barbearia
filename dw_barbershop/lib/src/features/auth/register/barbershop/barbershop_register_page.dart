import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:dw_barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/barbershop_register_state.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/barbershop_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/messages.dart';

class BarbershopRegisterPage extends ConsumerStatefulWidget {
  const BarbershopRegisterPage({super.key});

  @override
  ConsumerState<BarbershopRegisterPage> createState() =>
      _BarbershopRegisterPageState();
}

class _BarbershopRegisterPageState
    extends ConsumerState<BarbershopRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbershopRegisterVM =
        ref.watch(barbershopRegisterVmProvider.notifier);

    ref.listen(barbershopRegisterVmProvider, (_, state) {
      switch(state.status) {
        case BarbershopRegisterStateStatus.initial:
          break;
        case BarbershopRegisterStateStatus.error:
          context.showError('Desculpe ocorreu um erro ao registrar barbearia');
        case BarbershopRegisterStateStatus.success:
          Navigator.of(context).pushNamedAndRemoveUntil('/home/adm', (route) => false);
      }
    });   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cradastrar estabelecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
              const SizedBox(height: 22),
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
              WeekdaysPanel(
                onDayPressed: (String value) {
                  barbershopRegisterVM.addOrRemoveOpenDay(value);
                },
              ),
              const SizedBox(height: 24),
              HoursPanel(
                startTime: 6,
                endTime: 23,
                onHourPressed: (int value) {
                  barbershopRegisterVM.addOrRemoveOpenHour(value);
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56)),
                onPressed: () {
                  switch (formKey.currentState?.validate()) {
                    case null || false:
                      context.showError('Formulário invalido');
                    case true:
                    barbershopRegisterVM.register(
                        name: nameEC.text,
                        email: emailEC.text,
                    );
                  }
                },
                child: const Text('CADASTRAR ESTABELECIMENTO'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
