
import 'package:intl/intl.dart';

class CurrencyTypeFormatter {
  static String format(num value) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(value);
  }
}
