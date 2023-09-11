import 'package:dw_barbershop/src/barbershop_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails errorDatails) => CustomError(errorDatails: errorDatails);
  await initializeDateFormatting();
  runApp(const ProviderScope(child: BarbershopApp()));
}

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDatails;

  const CustomError({
    super.key,
    required this.errorDatails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(.3),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Error Occurred!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                kDebugMode
                    ? 'Oops... something went wrong'
                    : errorDatails.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
