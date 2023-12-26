import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/main_stat_model.dart';
import 'package:maple_app/model/stat/ability_stat_model.dart';
import 'package:maple_app/model/stat/hexamatrix_stat_model.dart';
import 'package:maple_app/model/stat/hyper_stat_model.dart';
import 'package:maple_app/model/stat/stat_model.dart';

// final statProvider =
//     AutoDisposeAsyncNotifierProvider<StatNotifier, MainStat>(StatNotifier.new);

// class StatNotifier extends AutoDisposeAsyncNotifier<MainStat> {
//   @override
//   FutureOr<MainStat> build() {
//     return MainStat(
//       stat: Stat(),
//       hyper: HyperStat(),
//       abiliaty: AbilityStat(),
//       hexamatrix: HexamatrixStat(),
//     );
//   }
// }

final statProvider = NotifierProvider<StatNotifier, MainStat>(StatNotifier.new);

class StatNotifier extends Notifier<MainStat> {
  @override
  MainStat build() {
    return MainStat(
      stat: Stat(),
      hyper: HyperStat(),
      ability: AbilityStat(),
      hexamatrix: HexamatrixStat(),
    );
  }

  void addStat(final statData) {
    state = state.copyWith(stat: Stat.fromJson(statData));
  }
}
