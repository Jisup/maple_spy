import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';

class PetDetailPage extends ConsumerWidget {
  const PetDetailPage({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    double imageSize = MediaQuery.of(context).size.width * 0.3;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.navigate_before_rounded,
                color: Colors.white,
                semanticLabel: '뒤로 가기 버튼',
              )),
        ),
        body: LayoutBuilder(
          builder:
              (BuildContext childContext, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: DimenConfig.commonDimen * 2,
                      bottom: DimenConfig.commonDimen * 2,
                    ),
                    color: EquipmentColor.detailBackground,
                    child: Column(
                      children: [
                        /**-----pet name */
                        Text(pet.petName!,
                            style: TextStyle(
                              fontSize: FontConfig.middleSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        /**-----pet type(label) */
                        pet.petPetType != null
                            ? Container(
                                margin:
                                    EdgeInsets.only(top: DimenConfig.subDimen),
                                child: Text(pet.petPetType!,
                                    style: TextStyle(
                                      color: StaticSwitchConfig
                                          .petLabelTextColor[pet.petPetType],
                                      fontSize: FontConfig.middleDownSize,
                                    )))
                            : const SizedBox.shrink(),
                        /**-----pet expire */
                        pet.petDateExpire != null
                            ? Container(
                                margin:
                                    EdgeInsets.only(top: DimenConfig.subDimen),
                                child: Text('마법의 시간 : ${pet.petDateExpire}까지',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontConfig.middleDownSize,
                                    )))
                            : const SizedBox.shrink(),
                        /**-----pet image */
                        Container(
                          margin: EdgeInsets.only(
                              top: DimenConfig.commonDimen * 2,
                              left: DimenConfig.commonDimen,
                              right: DimenConfig.commonDimen),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: imageSize,
                                height: imageSize,
                                margin: EdgeInsets.only(
                                    left: DimenConfig.commonDimen,
                                    right: DimenConfig.commonDimen),
                                child:
                                    /**-----item image */
                                    EquipmentDetailImageWidget(
                                  imageUrl: pet.petIcon!,
                                  petLabel: pet.petPetType ?? '캐시',
                                ),
                              ),
                              Expanded(
                                child: Text(pet.petDescription!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontConfig.middleDownSize,
                                    )),
                              )
                            ],
                          ),
                        )
                        /**-----pet description */
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
