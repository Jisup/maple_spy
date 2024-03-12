import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterNameProvider = StateProvider((_) => '');
final characterNameListProvider = StateProvider((_) => []);
final characterWorldProvider = StateProvider((_) => '');

final ocidProvider = StateProvider((_) => '');

/**-----select tab */
final equipmentSelectTabProvider = StateProvider((_) => 'item');
final equipmentItemPresetProvider = StateProvider((_) => 'main');
final equipmentCashPresetProvider = StateProvider((_) => 'main');
final equipmentSelectSymbolTabProvider = StateProvider((_) => 'ARC');

final statSelectTabProvider = StateProvider((_) => 'basic');
final abilityStatPresetProvider = StateProvider((_) => 'preset1');
final hyperStatPresetProvider = StateProvider((_) => 'preset1');

final skillSelectTabProvider = StateProvider((_) => 'hexa');

final unionSelectTabProvider = StateProvider((_) => 'raider');
final unionRaiderSelectTabProvider = StateProvider((_) => 'occupied');
