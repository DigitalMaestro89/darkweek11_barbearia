import 'dart:developer';

import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/src/features/employee/schedule/appointment_data_source.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeeSchedulePage extends StatelessWidget {
  const EmployeeSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Column(
        children: [
          const Text(
            "Nome e sobrenome",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 44),
          Expanded(
            child: SfCalendar(
              allowViewNavigation: true,
              view: CalendarView.day,
              showNavigationArrow: true,
              todayHighlightColor: ColorConstants.colorBrown,
              showDatePickerButton: true,
              showTodayButton: true,
              dataSource: AppointmentDataSource(), //schedules: schedules),
              appointmentBuilder: (context, calendarAppointmentDetails) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.colorBrown,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      calendarAppointmentDetails.appointments.first.subject,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ); 
              },
              //;onViewChanged: (viewChangedDetails) {
              //  if (ignoreFirstLoad) {
              //    ignoreFirstLoad = false;
              //    return;
              //  }
              //  final employeeSchedule = ref.read(
              //    employeeScheduleVMProvider(userId, dateSelected).notifier,
              //  );
              //  employeeSchedule.changeDate(
              //    userId,
              //    viewChangedDetails.visibleDates.first,
              // );
              //},
              onTap: (calendarTapDetails) {
                if (calendarTapDetails.appointments?.isNotEmpty ?? false) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final dateFormat = DateFormat('dd//MM/yyyy HH:mm');
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                // ignore: avoid_dynamic_calls
                                'Cliente: ${calendarTapDetails.appointments!.first.subject}',
                              ),
                              Text(
                                'Horário: ${dateFormat.format(calendarTapDetails.date ?? DateTime.now())}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
