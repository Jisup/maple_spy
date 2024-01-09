import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterNameProvider = StateProvider((_) => '');

final ocidProvider = StateProvider((_) => '');

/**-----select tab */
final equipmentSelectTabProvider = StateProvider((_) => 'item');
final equipmentSelectCashTabProvider = StateProvider((_) => 'preset1');
final equipmentSelectSymbolTabProvider = StateProvider((_) => 'ARC');

final statSelectTabProvider = StateProvider((_) => 'basic');
final hyperStatPresetProvider = StateProvider((_) => 'preset1');

final skillSelectTabProvider = StateProvider((_) => 'hexa');
