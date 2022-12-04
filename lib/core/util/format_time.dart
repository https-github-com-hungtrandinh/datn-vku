import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  bool formatDateToMillis(String time) {
    DateTime dateTime = DateTime.now();
    var dateTimeFormat =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'en-US').parse(time);
    if ((dateTime.microsecondsSinceEpoch -
                dateTimeFormat.microsecondsSinceEpoch)
            .compareTo(SharedPreference.time) >=
        1) {
      return false;
    }
    {
      return true;
    }
  }
}
