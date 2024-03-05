import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/controller/main_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final nickNameList = ref.watch(characterNameListProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (_textFieldController.text != '' &&
            !(textFormFieldKey.currentState?.validate() ?? true)) {
          _focusNode.requestFocus();
        }
      },
      excludeFromSemantics: true,
      child: MainContainer(
        isHome: true,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: DimenConfig.commonDimen * 2,
                  right: DimenConfig.commonDimen * 2),
              child: Column(
                children: [
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: ref.watch(mainController.hasError)
                              ? MainErrorPage(
                                  message:
                                      ref.watch(mainController.errorMessage))
                              : SizedBox.shrink(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: nickNameList.length != 0
                                  ? Text('최근 검색 닉네임',
                                      style: TextStyle(
                                        fontSize: FontConfig.middleDownSize,
                                        fontWeight: FontWeight.bold,
                                      ))
                                  : SizedBox.shrink(),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: nickNameList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: DimenConfig.commonDimen,
                                          right: DimenConfig.subDimen,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: DimenConfig.subDimen,
                                          bottom: DimenConfig.subDimen,
                                          left: DimenConfig.commonDimen,
                                          right: DimenConfig.subDimen,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorScheme.onSecondary,
                                          borderRadius: BorderRadius.circular(
                                              RadiusConfig.maxRadius),
                                        ),
                                        child: Row(
                                          children: [
                                            // GestureDetector(
                                            //   onTap: () => null,
                                            //   child: Container(
                                            //     margin: EdgeInsets.only(
                                            //       right: DimenConfig.minDimen,
                                            //     ),
                                            //     child: Icon(Icons.star_outline,
                                            //         size: FontConfig
                                            //             .middleDownSize,
                                            //         color: colorScheme.primary),
                                            //   ),
                                            //   // child: Image.asset(
                                            //   //     'assets/star_deactive_icon.png'),
                                            // ),
                                            GestureDetector(
                                              onTap: () => mainController
                                                  .onClickSearchButton(
                                                      characterName:
                                                          nickNameList
                                                              .elementAt(
                                                                  index)),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: DimenConfig.minDimen,
                                                ),
                                                child: Text(
                                                    nickNameList
                                                        .elementAt(index),
                                                    style: TextStyle(
                                                      fontSize:
                                                          FontConfig.commonSize,
                                                    )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => mainController
                                                  .onclickDeleteButton(
                                                      characterName:
                                                          nickNameList
                                                              .elementAt(
                                                                  index)),
                                              child: Icon(Icons.close,
                                                  size:
                                                      FontConfig.middleDownSize,
                                                  color: colorScheme.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Semantics(
                            label: '닉네임 입력 칸',
                            keyboardKey: true,
                            focusable: true,
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: DimenConfig.subDimen),
                              child: TextFormField(
                                key: textFormFieldKey,
                                focusNode: _focusNode,
                                controller: _textFieldController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '닉네임',
                                ),
                                inputFormatters: [
                                  TextInputFormatter.withFunction(
                                      (oldValue, newValue) {
                                    return newValue.text.contains(
                                            RegExp(r'[^0-9a-zA-Zㆍᆞᆢㅏ-ㅣㄱ-ㅎ가-힣]'))
                                        ? oldValue
                                        : newValue;
                                  })
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '닉네임을 입력해주세요.';
                                  } else if (value
                                      .contains(RegExp(r'[^0-9a-zA-Z가-힣]'))) {
                                    return '올바른 닉네임을 입력해주세요.';
                                  } else if (value
                                          .contains(RegExp(r'[0-9a-zA-Z]')) &&
                                      !value.contains(RegExp(r'[가-힣]')) &&
                                      value.characters.length < 4) {
                                    return '영문과 숫자조합 닉네임은 4글자 이상 입력해주세요.';
                                  } else if (value
                                          .contains(RegExp(r'[0-9a-zA-Z]')) &&
                                      value.contains(RegExp(r'[가-힣]')) &&
                                      value.characters.length < 3) {
                                    return '조합된 닉네임은 3글자 이상 입력해주세요.';
                                  } else if (value.length < 2) {
                                    return '닉네임은 2글자 이상 입력해주세요.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Semantics(
                          label: '검색 버튼',
                          button: true,
                          child: Container(
                            margin: EdgeInsets.only(left: DimenConfig.subDimen),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              border: Border.all(width: 1),
                              borderRadius:
                                  BorderRadius.circular(RadiusConfig.subRadius),
                            ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () =>
                                  textFormFieldKey.currentState?.validate() ??
                                          false
                                      ? {
                                          mainController.onClickSearchButton(
                                              characterName:
                                                  _textFieldController.text),
                                          _textFieldController.text = '',
                                          FocusScope.of(context).unfocus()
                                        }
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
                                      letterSpacing:
                                          SpacingConfig.commonSpacing),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/information'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary,
                        border: Border.all(
                          width: 1,
                          color: colorScheme.tertiary,
                        ),
                        borderRadius:
                            BorderRadius.circular(RadiusConfig.minRadius),
                      ),
                      margin:
                          EdgeInsets.only(bottom: DimenConfig.commonDimen * 2),
                      padding: EdgeInsets.fromLTRB(
                        DimenConfig.commonDimen,
                        DimenConfig.subDimen,
                        DimenConfig.commonDimen,
                        DimenConfig.subDimen,
                      ),
                      child: Text(
                        'MapleSpy 서비스 정보',
                        style: TextStyle(
                            fontSize: FontConfig.commonSize,
                            fontWeight: FontWeight.bold,
                            letterSpacing: SpacingConfig.commonSpacing),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ref.watch(mainController.isLoading)
                ? LoadingSpinner()
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
