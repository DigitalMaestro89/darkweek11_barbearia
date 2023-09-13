import 'package:dw_barbershop/src/core/ui/helpers/context_extension.dart';
import 'package:dw_barbershop/src/core/ui/helpers/messages.dart';
import 'package:dw_barbershop/src/features/schedule/schedule_state.dart';
import 'package:dw_barbershop/src/features/schedule/schedule_vm.dart';
import 'package:dw_barbershop/src/model/user_model.dart';
import 'package:flutter/material.dart';

import 'package:dw_barbershop/src/core/ui/barbershop_icons.dart';
import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:dw_barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:dw_barbershop/src/features/schedule/widgets/schedule_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({
    super.key,
  });

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  var dateFormat = DateFormat('dd/MM/yyyy');
  var showCalendar = false;
  final formKey = GlobalKey<FormState>();
  final clientEC = TextEditingController();
  final dateEC = TextEditingController();

  @override
  void dispose() {
    clientEC.dispose();
    dateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
    final scheduleVM = ref.watch(scheduleVmProvider.notifier);

    final employeeData = switch (userModel) {
      UserModelADM(:final workDays, :final workHours) => (
          workDays: workDays!,
          workHours: workHours!,
        ),
      UserModelEmployee(:final workDays, :final workHours) => (
          workDays: workDays,
          workHours: workHours,
        ),
    };

    ref.listen(
      scheduleVmProvider.select((state) => state.status),
      (_, status) {
        switch (status) {
          case ScheduleStateStatus.initial:
            break;
          case ScheduleStateStatus.success:
            context.showSuccess('Cliente agendado com sucesso');
            context.pop();
          case ScheduleStateStatus.error:
            context.showError('Erro ao registrar agendamento');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cliente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const AvatarWidget.withoutButton(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    userModel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  TextFormField(
                    controller: clientEC,
                    validator: Validatorless.required('Cliente obrigatório'),
                    decoration: const InputDecoration(label: Text('Cliente')),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: dateEC,
                    validator: Validatorless.required(
                        'Selecione a data do agendamento'),
                    onTap: () {
                      setState(() {
                        showCalendar = true;
                      });
                      context.unfocus();
                    },
                    decoration: const InputDecoration(
                      label: Text('Selecione uma data'),
                      hintText: 'Selecione uma data',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: Icon(
                        BarbershopIcons.calendar,
                        color: ColorConstants.colorBrown,
                        size: 18,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: !showCalendar,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        ScheduleCalendar(
                          cancelPressed: () {
                            setState(() {
                              showCalendar = false;
                            });
                          },
                          onPressed: (DateTime value) {
                            setState(() {
                              dateEC.text = dateFormat.format(value);
                              scheduleVM.deteSelecte(value);
                              showCalendar = false;
                            });
                          },
                          workDays: employeeData.workDays,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HoursPanel.singleSelection(
                    startTime: 6,
                    endTime: 23,
                    onHourPressed: scheduleVM.hourSelect,
                    enabledTimes: employeeData.workHours,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56)),
                    onPressed: () {
                      switch (formKey.currentState?.validate()) {
                        case (false || null):
                          context.showError('Dados incompletos');
                        case true:
                          //   login(emailEC.text, passwordEC.text);
                          final hourSelected = ref.watch(
                            scheduleVmProvider
                                .select((state) => state.scheduleTime != null),
                          );
                          if (hourSelected) {
                             scheduleVM.register(
                              userModel: userModel,
                              clientName: clientEC.text,
                            );
                          } else {
                            context.showError(
                                'Por favor selecione um horário de atendimento');
                          }
                      }
                    },
                    child: const Text('AGENDAR'),
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
