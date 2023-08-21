import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  const WeekdaysPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione os dias da semana',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            ButtonDay()
          ],
        )
      ],
    );
  }
}

class ButtonDay extends StatelessWidget {
  const ButtonDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: ColorConstants.colorGrey,
        ),
      ),
      child: const Center(
          child: Text(
        'Seg',
        style: TextStyle(
          fontSize: 12,
          color: ColorConstants.colorGrey,
          fontWeight: FontWeight.w500
        ),
      )),
    );
  }
}
