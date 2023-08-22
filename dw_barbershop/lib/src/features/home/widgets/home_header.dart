import 'package:dw_barbershop/src/core/ui/barbershop_icons.dart';
import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final bool showFilter;

  const HomeHeader({super.key}): showFilter = true;
  const HomeHeader.withoutFilter({super.key}): showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        image: DecorationImage(
          image: AssetImage(
            ImageConstants.backgroundChair,
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xffbdbdbd),
                child: SizedBox.shrink(),
              ),
              const SizedBox(
                width: 16,
              ),
              const Flexible(
                child: Text(
                  'Carlos Alberto da Costa Pinto',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                child: Text(
                  'editar',
                  style: TextStyle(
                    color: ColorConstants.colorBrown,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  BarbershopIcons.exit,
                  color: ColorConstants.colorBrown,
                  size: 32,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Bem Vindo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Agenda um Cliente',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          Offstage(
            offstage: !showFilter,
            child: const SizedBox(
              height: 24,
            ),
          ),
          Offstage(
            offstage: !showFilter,
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Buscar Colaborador'),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Icon(
                    BarbershopIcons.search,
                    color: ColorConstants.colorBrown,
                    size: 26,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
