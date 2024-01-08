import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/controller/common_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

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

  @override
  void dispose() {
    _textFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final mainController = ref.watch(mainControllerProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (!(textFormFieldKey.currentState?.validate() ?? true)) {
          _focusNode.requestFocus();
        }
      },
      excludeFromSemantics: true,
      child: MainContainer(
        isHome: true,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                              } else if (value.contains(RegExp(r'[0-9a-zA-Z]')) && !value.contains(RegExp(r'[가-힣]')) && value.characters.length < 4) {
                                return '영문과 숫자조합 닉네임은 4글자 이상 입력해주세요.';
                              } else if (value.contains(RegExp(r'[0-9a-zA-Z]')) && value.contains(RegExp(r'[가-힣]')) && value.characters.length < 3) {
                                return '조합된 닉네임은 3글자 이상 입력해주세요.';
                              } else if (value.length < 2) {
                                return '닉네임은 2글자 이상 입력해주세요.';
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
                          onTap: () => textFormFieldKey.currentState?.validate() ?? false ? {mainController.onClickSearchButton(characterName: _textFieldController.text), FocusScope.of(context).unfocus()} : _focusNode.requestFocus(),
                          child: Container(
                            padding: EdgeInsets.only(
                              top: DimenConfig.commonDimen * 2,
                              bottom: DimenConfig.commonDimen * 2,
                              left: DimenConfig.commonDimen,
                              right: DimenConfig.commonDimen,
                            ),
                            child: Text(
                              '검색',
                              style: TextStyle(color: colorScheme.onPrimary, letterSpacing: SpacingConfig.commonSpacing),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ref.watch(mainController.hasError) ? MainErrorPage(message: ref.watch(mainController.errorMessage)) : SizedBox.shrink(),
                ],
              ),
            ),
            ref.watch(mainController.isLoading) ? LoadingSpinner() : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
