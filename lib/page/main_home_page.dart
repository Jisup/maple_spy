import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/container/main_container.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomeState();
}

GlobalKey<FormFieldState> textFormFieldKey = GlobalKey<FormFieldState>();

class _MainHomeState extends ConsumerState<MainHomePage> {
  late TextEditingController _textFieldController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
    _focusNode = FocusNode();
  }

  void onClickSearchButton() {
    ref
        .read(characterNameProvider.notifier)
        .update((state) => _textFieldController.text);
    context.go('/character');
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      excludeFromSemantics: true,
      child: MainContainer(
        isHome: true,
        body: Container(
          padding: EdgeInsets.only(
              left: DimenConfig.commonDimen * 2,
              right: DimenConfig.commonDimen * 2),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: DimenConfig.subDimen),
                  child: TextFormField(
                    key: textFormFieldKey,
                    focusNode: _focusNode,
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '닉네임',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '닉네임을 입력해주세요.';
                      } else if (value.contains(RegExp(r'[^0-9a-zA-Z가-힣]'))) {
                        return '올바른 닉네임을 입력해주세요.';
                      }
                      return null;
                    },
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
                  onTap: () =>
                      textFormFieldKey.currentState?.validate() ?? false
                          ? onClickSearchButton()
                          : _focusNode.requestFocus(),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: DimenConfig.commonDimen * 2,
                      bottom: DimenConfig.commonDimen * 2,
                      left: DimenConfig.commonDimen,
                      right: DimenConfig.commonDimen,
                    ),
                    child: Text(
                      '검색',
                      style: TextStyle(
                          color: colorScheme.onPrimary,
                          letterSpacing: SpacingConfig.commonSpacing),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
