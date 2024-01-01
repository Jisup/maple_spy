class ItemDetailStat {
  String stat;
  String total;
  String base;
  String? add;
  String? etc;
  String? starforce;
  bool? percent;

  ItemDetailStat(
      {required this.stat,
      required this.total,
      required this.base,
      this.add,
      this.etc,
      this.starforce,
      required this.percent});
}
