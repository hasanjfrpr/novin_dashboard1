/// Success : "True"
/// LogStr : ""

class Result {
  Result({
      String? success, 
      String? logStr,}){
    _success = success;
    _logStr = logStr;
}

  Result.fromJson(dynamic json) {
    _success = json['Success'];
    _logStr = json['LogStr'];
  }
  String? _success;
  String? _logStr;
Result copyWith({  String? success,
  String? logStr,
}) => Result(  success: success ?? _success,
  logStr: logStr ?? _logStr,
);
  String? get success => _success;
  String? get logStr => _logStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = _success;
    map['LogStr'] = _logStr;
    return map;
  }

}