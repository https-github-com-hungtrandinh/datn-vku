
import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  return DateFormat("HH:mm").format(dateTime);
}
