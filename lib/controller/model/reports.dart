class BarData {
  final String date;
  final String location;
  final String userReportNum;
  BarData(this.location, this.userReportNum, this.date);

  BarData.fromMap(Map<String, dynamic> map)
      : assert(map['date'] != null),
        assert(map['location'] != null),
        assert(map['user_report_num'] != null),
        date = map['date'],
        location = map['location'],
        userReportNum = map['user_report_num'];

  @override
  String toString() => "Record<$date:$location:$userReportNum>";
}
