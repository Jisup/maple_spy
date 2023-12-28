import 'package:intl/intl.dart';

class DayInstance {
  static final DayInstance _instance = DayInstance._internal();
  late DateFormat formatter;

  DayInstance._internal() {
    formatter = DateFormat('yyyy-MM-dd');
  }

  String get yesterday => formatter.format(
        DateTime.now().subtract(
          const Duration(hours: 25),
        ),
      );

  factory DayInstance() {
    return _instance;
  }
}
