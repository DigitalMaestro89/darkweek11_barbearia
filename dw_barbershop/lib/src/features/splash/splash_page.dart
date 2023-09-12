import 'dart:developer';

import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:dw_barbershop/src/core/ui/helpers/messages.dart';
import 'package:dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:dw_barbershop/src/features/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimetionWidth => 100 * _scale;
  double get _logoAnimetionHeight => 120 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1;
      });
    });
    super.initState();
  }

  void _redirect(String routeName) {}

  @override
  Widget build(BuildContext context) {
    ref.listen(splashVmProvider, (_, state) {
      state.whenOrNull(
        error: (error, stackTrace) {
          log('Erro ao Validar', error: error, stackTrace: stackTrace);
          context.showError('Erro ao Validar o login');
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/auth/login', (route) => false);
        },
        data: (data) {
          switch (data) {
            case SplashState.loggedADM:
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home/adm', (route) => false);
            case SplashState.loggedEmployee:
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home/employee', (route) => false);
            case _:
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/auth/login', (route) => false);
          }
        },
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstants.backgroundChair,
            ),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              curve: Curves.easeIn,
              opacity: _animationOpacityLogo,
              onEnd: () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: const RouteSettings(name: '/auth/login'),
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return const LoginPage();
                    },
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  (router) => false,
                );
              },
              child: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  width: _logoAnimetionWidth,
                  height: _logoAnimetionHeight,
                  curve: Curves.linearToEaseOut,
                  child: Image.asset(
                    ImageConstants.imageLogo,
                    fit: BoxFit.cover,
                  ))),
        ),
      ),
    );
  }
}
