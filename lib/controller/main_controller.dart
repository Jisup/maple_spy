import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/dio_instance.dart';
import 'package:maplespy/util/main_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final mainControllerProvider = AutoDisposeNotifierProvider(MainController.new);

class MainController extends AutoDisposeNotifier {
  final isLoading = StateProvider((_) => false);
  final hasError = StateProvider((_) => false);
  final errorMessage = StateProvider((_) => '');

  @override
  build() {}

  void getNickNameList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? nickNameList = prefs.getStringList('nickName');
    ref
        .read(characterNameListProvider.notifier)
        .update((state) => [...?nickNameList]);
  }

  void onClickSearchButton({required String characterName}) async {
    var context = navigatorkey.currentContext!;

    ref.read(isLoading.notifier).update((state) => true);
    ref.read(hasError.notifier).update((state) => false);
    ref.read(errorMessage.notifier).update((state) => '');

    String ocid = '';
    DioInstance dioInstance = DioInstance();

    dioInstance.dio.options.queryParameters = {'character_name': characterName};

    try {
      final ocidResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_OCID_PATH'));
      ocid = ocidResponse.data['ocid'];
    } on DioException catch (e) {
      ref.read(hasError.notifier).update((state) => true);
      ref
          .read(errorMessage.notifier)
          .update((state) => '[ ${characterName} ]님을 찾을 수 없어요!ㅠㅠ');
    }

    if (ref.watch(hasError)) {
      ref.read(isLoading.notifier).update((state) => false);
      return;
    }

    /**----- 캐싱 정보 업데이트 */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? oldNickNameList = prefs.getStringList('nickName');
    oldNickNameList?.remove(characterName);
    List<String> newNickNameList = [characterName, ...?oldNickNameList];
    prefs.setStringList('nickName', newNickNameList);
    ref
        .read(characterNameListProvider.notifier)
        .update((state) => newNickNameList);

    /**----- 기본 정보 업데이트 */
    ref.read(characterNameProvider.notifier).update((state) => characterName);
    ref.read(ocidProvider.notifier).update((state) => ocid);

    /**----- 선택 탭 정보 초기화 */
    ref.read(equipmentSelectTabProvider.notifier).update((state) => 'item');
    ref.read(equipmentItemPresetProvider.notifier).update((state) => 'main');
    ref.read(equipmentCashPresetProvider.notifier).update((state) => 'main');
    ref
        .read(equipmentSelectSymbolTabProvider.notifier)
        .update((state) => 'ARC');

    ref.read(statSelectTabProvider.notifier).update((state) => 'basic');
    ref.read(abilityStatPresetProvider.notifier).update((state) => 'preset1');
    ref.read(hyperStatPresetProvider.notifier).update((state) => 'preset1');

    ref.read(skillSelectTabProvider.notifier).update((state) => 'hexa');

    ref.read(unionSelectTabProvider.notifier).update((state) => 'raider');
    ref.read(unionRaiderSelectTabProvider.notifier).update((state) => 'whole');

    /**----- 캐릭터 정보 업데이트 */
    ref.read(asyncCharacterProvider.notifier).getNewCharacter();
    /**----- 캐릭터 정보 페이지 이동 */
    context.push('/character');

    ref.read(isLoading.notifier).update((state) => false);
  }

  void onclickDeleteButton({required String characterName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? oldNickNameList = prefs.getStringList('nickName');
    oldNickNameList?.remove(characterName);
    prefs.setStringList('nickName', [...?oldNickNameList]);
    ref
        .read(characterNameListProvider.notifier)
        .update((state) => [...?oldNickNameList]);
  }
}
