import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/provider/common_provider.dart';

class SkillFloatingActionButton extends ConsumerWidget {
  const SkillFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final skillToggle = ref.watch(skillToggleProvider);

    return GestureDetector(
      onTap: () {
        if (ref
            .read(skillControllerProvider.notifier)
            .scrollController
            .hasClients) {
          ref.read(skillControllerProvider.notifier).scrollController.jumpTo(0);
        }
        ref.read(skillControllerProvider.notifier).changeSkillToggle();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4 - 30,
        height: MediaQuery.of(context).size.width / 4 - 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(RadiusConfig.maxRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: RadiusConfig.minRadius,
                offset: const Offset(2, 2),
                color: Colors.black,
              )
            ]),
        child: Text(
          skillToggle ? '축소\n보기' : '확장\n보기',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.25,
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontFamily: 'Maplestory',
          ),
        ),
      ),
    );
  }
}
