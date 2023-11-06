
class DateUtil{

  //parsing to yyyy-MM-dd with 0 if length is 1
  static String parseFromYearMonthDay(int year, int month, int day){
    var parseMonth = month.toString().length < 2 ? "0$month" : "$month";
    var parseDay = day.toString().length < 2 ? "0$day" : "$day";

    return "$year-$parseMonth-$parseDay";
  }

  static String parseFromDate({required DateTime dateTime}){
    return parseFromYearMonthDay(dateTime.year, dateTime.month, dateTime.day);
  }

  String monthByDateServer(String date){
    var data = date.split(" ");

    return data[1];
  }

  String dateByDateServer(String date){
    var data = date.split(" ");

    return data[2];
  }

  String yearByDateServer(String date){
    var data = date.split(" ");

    return data[3];
  }

  String timeByDateServer(String date){
    var data = date.split(" ");

    return data[4];
  }

  DateTime dateTimeFromParseServer(String date){

    var year = int.parse(yearByDateServer(date));
    var month = int.parse(monthByDateServer(date));
    var day = int.parse(dateByDateServer(date));
    var timeAll = timeByDateServer(date);
    var hour = int.parse(timeAll.split(":")[0]);
    var minute = int.parse(timeAll.split(":")[1]);
    var second = int.parse(timeAll.split(":")[2]);

    DateTime parseToDateTime = DateTime(year, month, day, hour, minute, second).toLocal();

    return parseToDateTime;
  }
}

extension DateExt on DateTime {

  DateTime addYear(int years){
    var added = year + years;
    var parseDate = DateUtil.parseFromYearMonthDay(added, month, day);

    return DateTime.parse(parseDate);
  }

  DateTime subtractYear(int years){
    var added = year - years;
    var parseDate = DateUtil.parseFromYearMonthDay(added, month, day);

    return DateTime.parse(parseDate);
  }

  String timeAgoID({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? 'Seminggu yang lalu' : 'Minggu lalu';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} hari lalu';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? 'hari yang lalu' : 'Kemarin';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? 'Sejam yang lalu' : 'Beberapa jam yang lalu';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? 'Semenit yang lalu' : 'Beberapa menit lalu';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} detik lalu';
    } else {
      return 'Baru saja';
    }
  }

  bool isAfterTomorrow(){

    DateTime compareDate = DateTime.now();
    DateTime lookAtDate = add(const Duration(days: 1));

    return compareDate.isAfter(lookAtDate);
  }

  bool isAfterHours(int hour){
    DateTime compareDate = DateTime.now();
    DateTime lookAtDate = add(Duration(hours: hour));

    return lookAtDate.isAfter(compareDate);
  }

  bool isAfterMinutes(int minutes){
    DateTime compareDate = DateTime.now();
    DateTime lookAtDate = add(Duration(minutes: minutes));

    return compareDate.isAfter(lookAtDate);
  }

  String dayByDateServer(String date){
    var data = date.split(" ");

    return data[0];
  }



}