import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/widget/main_container.dart';

class MainHome extends ConsumerStatefulWidget {
  const MainHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomeState();
}

class _MainHomeState extends ConsumerState<MainHome> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController = TextEditingController();
  }

  void searchUser() {
    final String nickName = _textFieldController.text;
    if (nickName == "") return;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MainContainer(
      isHome: true,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.125,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => searchUser(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    DimenConfig.commonDimen,
                    DimenConfig.maxDimen,
                    DimenConfig.commonDimen,
                    DimenConfig.maxDimen),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  border: Border.all(width: 1),
                  borderRadius:
                      BorderRadius.circular(RadiusConfig.comminRadius),
                ),
                child: GestureDetector(
                  onTap: () => searchUser(),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(DimenConfig.commonDimen),
                          child: Text(
                            '검색',
                            style: TextStyle(
                                color: colorScheme.onPrimary,
                                letterSpacing: SpacingConfig.comminSpacing),
                          ),
                        ),
                      ),
                    ],
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
