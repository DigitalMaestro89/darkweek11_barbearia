import 'package:dw_barbershop/src/core/ui/barbershop_icons.dart';
import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {

  final bool hideUploadUploadButton;

  const AvatarWidget({
    super.key,
    this.hideUploadUploadButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102,
      height: 102,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.avatar),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Offstage(
              offstage: hideUploadUploadButton,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: ColorConstants.colorBrown, width: 4),
                    shape: BoxShape.circle),
                child: const Icon(
                  BarbershopIcons.addEmplyeee,
                  color: ColorConstants.colorBrown,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
