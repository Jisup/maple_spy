import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/container/main_container.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomeState();
}

class _MainHomeState extends ConsumerState<MainHomePage> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  void onClickSearchButton() {
    ref
        .read(characterNameProvider.notifier)
        .update((state) => _textFieldController.text);
    context.push('/character');
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MainContainer(
      isHome: true,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(
            left: DimenConfig.commonDimen * 2,
            right: DimenConfig.commonDimen * 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: DimenConfig.subDimen),
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: DimenConfig.subDimen),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _textFieldController.text == ""
                      ? null
                      : onClickSearchButton(),
                  child: Container(
                    padding: EdgeInsets.all(DimenConfig.commonDimen),
                    child: Text(
                      '검색',
                      style: TextStyle(
                          color: colorScheme.onPrimary,
                          letterSpacing: SpacingConfig.commonSpacing),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
