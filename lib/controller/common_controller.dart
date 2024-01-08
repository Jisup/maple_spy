import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/dio_instance.dart';
import 'package:maplespy/util/main_router.dart';

final mainControllerProvider = NotifierProvider(MainController.new);

class MainController extends Notifier {
  final isLoading = StateProvider((_) => false);
  final hasError = StateProvider((_) => false);
  final errorMessage = StateProvider((_) => '');

  @override
  build() {}

  void onClickSearchButton({required String characterName}) async {
    var context = navigatorkey.currentContext!;

    ref.read(isLoading.notifier).update((state) => true);
    ref.read(hasError.notifier).update((state) => false);
    ref.read(errorMessage.notifier).update((state) => '');

    String ocid = '';
    DioInstance dioInstance = DioInstance();

    dioInstance.dio.options.queryParameters = {'character_name': characterName};

    try {
      final ocidResponse = await dioInstance.dio.get(dotenv.get('MAPLESTORY_OCID_PATH'));
      ocid = ocidResponse.data['ocid'];
    } on DioException catch (e) {
      ref.read(hasError.notifier).update((state) => true);
      ref.read(errorMessage.notifier).update((state) => '${characterName}님을 찾을 수 없어요!ㅠㅠ');
    }

    if (!ref.read(hasError)) {
      ref.read(characterNameProvider.notifier).update((state) => characterName);
      ref.read(ocidProvider.notifier).update((state) => ocid);
      context.go('/character');
    }

    ref.read(isLoading.notifier).update((state) => false);
  }
}
