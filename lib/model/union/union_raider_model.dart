import 'package:maplespy/config/static_switch_config.dart';

class UnionRaider {
  String? date;
  List<String>? unionRaiderStat;
  List<String>? unionOccupiedStat;
  List<UnionInnerStat>? unionInnerStat;
  List<UnionBlock>? unionBlock;
  late List<List<List<bool>>> unionTableBorder;
  late List<List<UnionDetail>> unionTable;
  late List<String> unionInnerField;
  late List<String> unionOuterField;

  UnionRaider(
      {this.date,
      this.unionRaiderStat,
      this.unionOccupiedStat,
      this.unionInnerStat,
      this.unionBlock});

  UnionRaider.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    unionRaiderStat = json['union_raider_stat'].cast<String>();
    unionOccupiedStat = json['union_occupied_stat'].cast<String>();
    if (json['union_inner_stat'] != null) {
      unionInnerStat = <UnionInnerStat>[];
      json['union_inner_stat'].forEach((v) {
        unionInnerStat!.add(new UnionInnerStat.fromJson(v));
      });
    }
    if (json['union_block'] != null) {
      unionBlock = <UnionBlock>[];
      json['union_block'].forEach((v) {
        unionBlock!.add(new UnionBlock.fromJson(v));
      });
    }

    /**----- 유니온 필드 */
    unionInnerField = [];
    if (unionInnerStat != null && unionInnerStat!.isNotEmpty) {
      unionInnerField = unionInnerStat!.map((stat) {
        return stat.statFieldEffect!
            .replaceAll(' ', '')
            .replaceAll('유니온', '')
            .replaceAll('최대', '');
      }).toList();
    }
    unionOuterField = [
      '상태이상내성',
      '획득경험치',
      '크리티컬\n확률',
      '보스데미지',
      '일반데미지',
      '버프지속시간',
      '방어율무시',
      '크리티컬\n데미지'
    ];

    /**----- 유니온 레이더 스탯 정렬 */
    if (unionRaiderStat != null && unionRaiderStat!.isNotEmpty) {
      unionRaiderStat!.sort((a, b) {
        var a_result = StaticSwitchConfig.switchUnionStat(stat: a);
        var b_result = StaticSwitchConfig.switchUnionStat(stat: b);
        if (a_result == b_result) {
          return a.compareTo(b);
        }
        return a_result - b_result;
      });
    }

    /**----- 유니온 배치 스탯 정렬 */
    if (unionOccupiedStat != null && unionOccupiedStat!.isNotEmpty) {
      unionOccupiedStat!.sort((a, b) {
        var a_result = StaticSwitchConfig.switchUnionStat(stat: a);
        var b_result = StaticSwitchConfig.switchUnionStat(stat: b);
        if (a_result == b_result) {
          return a.compareTo(b);
        }
        return a_result - b_result;
      });
    }

    /**----- 유니온 테이블 테두리 제작 */
    unionTableBorder = List.generate(
        22, (_) => List.generate(24, (_) => List.generate(4, (_) => false)));

    // 좌상향 10,11에서 -1/-1
    for (var y = 10, x = 11; y > 0 && x > 0; y--, x--) {
      unionTableBorder[y][x] = [false, true, true, false];
    }
    // 우상향 10,12에서 -1/+1
    for (var y = 10, x = 12; y > 0 && x < 23; y--, x++) {
      unionTableBorder[y][x] = [false, true, false, true];
    }
    // 좌하향 11,11에서 +1/-1
    for (var y = 11, x = 11; y < 21 && x > 0; y++, x--) {
      unionTableBorder[y][x] = [true, false, true, false];
    }
    // 우하향 11,12에서 +1/+1
    for (var y = 11, x = 12; y < 21 && x < 23; y++, x++) {
      unionTableBorder[y][x] = [true, false, false, true];
    }
    // 세로 직선
    for (var y = 1; y < 21; y++) {
      if (y > 5 && y < 16) {
        unionTableBorder[y][6][2] = true;
        unionTableBorder[y][17][3] = true;
      }
      unionTableBorder[y][11][3] = true;
      unionTableBorder[y][12][2] = true;
    }
    // 가로 직선
    for (var x = 1; x < 23; x++) {
      if (x > 5 && x < 18) {
        unionTableBorder[5][x][1] = true;
        unionTableBorder[16][x][0] = true;
      }
      unionTableBorder[10][x][1] = true;
      unionTableBorder[11][x][0] = true;
    }
    // 가운데 블록

    // 예외
    unionTableBorder[1][1][0] = true;
    unionTableBorder[20][1][1] = true;
    unionTableBorder[1][22][0] = true;
    unionTableBorder[20][22][1] = true;

    /**----- 유니온 테이블 제작 */
    unionTable =
        List.generate(22, (_) => List.generate(24, (_) => UnionDetail()));
    if (unionBlock != null && unionBlock!.isNotEmpty) {
      for (var block in unionBlock!) {
        int cy = block.blockControlPoint!.y! + 10;
        int cx = block.blockControlPoint!.x! + 12;
        unionTable[cy][cx].isPoint = true;
        unionTable[cy][cx].type = block.blockType;

        for (var position in block.blockPosition!) {
          int py = position.y! + 10;
          int px = position.x! + 12;
          unionTable[py][px].isExist = true;
        }
      }
    }

    List<int> dy = [-1, 1, 0, 0];
    List<int> dx = [0, 0, -1, 1];

    bool range(int y, int x) {
      return y < 0 || x < 0 || y > 21 || x > 23;
    }

    for (var y = 1; y < 22; y++) {
      for (var x = 1; x < 24; x++) {
        if (unionTable[y][x].isExist) {
          for (var d = 0; d < 4; d++) {
            int ny = y + dy[d];
            int nx = x + dx[d];
            if (!range(ny, nx) && !unionTable[ny][nx].isExist) {
              unionTable[y][x].border[d] = true;
            }
          }
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['union_raider_stat'] = this.unionRaiderStat;
    data['union_occupied_stat'] = this.unionOccupiedStat;
    if (this.unionInnerStat != null) {
      data['union_inner_stat'] =
          this.unionInnerStat!.map((v) => v.toJson()).toList();
    }
    if (this.unionBlock != null) {
      data['union_block'] = this.unionBlock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnionInnerStat {
  String? statFieldId;
  String? statFieldEffect;

  UnionInnerStat({this.statFieldId, this.statFieldEffect});

  UnionInnerStat.fromJson(Map<String, dynamic> json) {
    statFieldId = json['stat_field_id'];
    statFieldEffect = json['stat_field_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat_field_id'] = this.statFieldId;
    data['stat_field_effect'] = this.statFieldEffect;
    return data;
  }
}

class UnionBlock {
  String? blockType;
  String? blockClass;
  String? blockLevel;
  BlockControlPoint? blockControlPoint;
  List<BlockPosition>? blockPosition;

  UnionBlock(
      {this.blockType,
      this.blockClass,
      this.blockLevel,
      this.blockControlPoint,
      this.blockPosition});

  UnionBlock.fromJson(Map<String, dynamic> json) {
    blockType = json['block_type'];
    blockClass = json['block_class'];
    blockLevel = json['block_level'];
    blockControlPoint = json['block_control_point'] != null
        ? new BlockControlPoint.fromJson(json['block_control_point'])
        : null;
    if (json['block_position'] != null) {
      blockPosition = <BlockPosition>[];
      json['block_position'].forEach((v) {
        blockPosition!.add(new BlockPosition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block_type'] = this.blockType;
    data['block_class'] = this.blockClass;
    data['block_level'] = this.blockLevel;
    if (this.blockControlPoint != null) {
      data['block_control_point'] = this.blockControlPoint!.toJson();
    }
    if (this.blockPosition != null) {
      data['block_position'] =
          this.blockPosition!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlockControlPoint {
  int? x;
  int? y;

  BlockControlPoint({this.x, this.y});

  BlockControlPoint.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class BlockPosition {
  int? x;
  int? y;

  BlockPosition({this.x, this.y});

  BlockPosition.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class UnionDetail {
  bool isExist = false;
  bool isPoint = false;
  String? type;
  List<bool> border = [false, false, false, false]; // 상, 하, 좌, 우
}
