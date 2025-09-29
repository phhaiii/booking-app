import 'package:intl/intl.dart';

class WFormatters{
  static String formatDate(DateTime date){
   date ??= DateTime.now();
   return DateFormat('dd/MM/yyyy').format(date);
  }
  static String formatCurrency(double amount){
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'vi_VN');
    return formatCurrency.format(amount);
  }
  static String formatPhoneNumber(String phoneNumber){
    final raw = (phoneNumber ?? '').trim();
    if (raw.isEmpty) return '';
    final cleaned = raw.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length == 10) return cleaned;
    if (cleaned.length == 10) return cleaned;
    return '';
  }

}