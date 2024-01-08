import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/main_stat_model.dart';
import 'package:maplespy/model/stat/ability_stat_model.dart';
import 'package:maplespy/model/stat/hexa_matrix_stat_model.dart';
import 'package:maplespy/model/stat/hyper_stat_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncStatProvider = AutoDisposeAsyncNotifierProvider<StatNotifier, MainStat>(StatNotifier.new);

class StatNotifier extends AutoDisposeAsyncNotifier<MainStat> {
  Future<MainStat> _fetchStat() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----basic stat */
    Response basicResponse = await dioInstance.dio.get(dotenv.get('MAPLESTORY_STAT_PATH'));
    final basicStat = Stat.fromJson(basicResponse.data);

    /**-----hyper stat */
    Response hyperResponse = await dioInstance.dio.get(dotenv.get('MAPLESTORY_HYPERSTAT_PATH'));
    final hyperStat = HyperStat.fromJson(hyperResponse.data);

    /**-----ability stat */
    Response abilityResponse = await dioInstance.dio.get(dotenv.get('MAPLESTORY_ABILITY_PATH'));
    final abilityStat = AbilityStat.fromJson(abilityResponse.data);

    /**-----hexa matrix stat */
    Response hexaMatrixResponse = await dioInstance.dio.get(dotenv.get('MAPLESTORY_HEXAMATRIXSTAT_PATH'));
    final hexaMatrixStat = HexaMatrixStat.fromJson(hexaMatrixResponse.data);

    return MainStat(stat: basicStat, hyperStat: hyperStat, abilityStat: abilityStat, hexaMatrixStat: hexaMatrixStat);
  }

  @override
  Future<MainStat> build() {
    return _fetchStat();
  }
}
