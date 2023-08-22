import 'package:dw_barbershop/src/core/ui/barbershop_icons.dart';
import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:dw_barbershop/src/features/home/adm/widgets/home_employee_tile.dart';
import 'package:dw_barbershop/src/features/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeAdmPage extends StatelessWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorConstants.colorBrown,
          onPressed: () {},
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 12,
            child: Icon(
              BarbershopIcons.addEmplyeee,
              color: ColorConstants.colorBrown,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => const HomeEmployeeTile(),
              childCount: 20,
            )),
          ],
        ),
      ),
    );
  }
}
