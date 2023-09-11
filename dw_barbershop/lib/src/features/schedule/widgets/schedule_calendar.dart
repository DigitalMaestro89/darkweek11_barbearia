import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({super.key});

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffe6e2e9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TableCalendar(
              availableGestures: AvailableGestures.none,
              headerStyle: const HeaderStyle(titleCentered: true),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2015, 01, 01),
              lastDay: DateTime.now().add(const Duration(days: 365 * 10)),
              calendarFormat: CalendarFormat.month,
              locale: 'pt_BR',
              availableCalendarFormats: const {
                CalendarFormat.month: 'Mês',
              },
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  this.selectedDay = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                      color: ColorConstants.colorBrown, shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(
                      color: ColorConstants.colorBrown.withOpacity(0.4),
                      shape: BoxShape.circle))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.colorBrown,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.colorBrown,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
