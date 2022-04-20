/// Result : {"Access":"True","PersianName":"ميلاد شريفزاد","Success":"True","LogStr":""}

class SignInModel {
  SignInModel({
      Result? result,}){
    _result = result;
}

  SignInModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  Result? _result;

  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    return map;
  }

}

/// Access : "True"
/// PersianName : "ميلاد شريفزاد"
/// Success : "True"
/// LogStr : ""

class Result {
  Result({
      String? access, 
      String? persianName, 
      String? success, 
      String? logStr,}){
    _access = access;
    _persianName = persianName;
    _success = success;
    _logStr = logStr;
}

  Result.fromJson(dynamic json) {
    _access = json['Access'];
    _persianName = json['PersianName'];
    _success = json['Success'];
    _logStr = json['LogStr'];
  }
  String? _access;
  String? _persianName;
  String? _success;
  String? _logStr;

  String? get access => _access;
  String? get persianName => _persianName;
  String? get success => _success;
  String? get logStr => _logStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Access'] = _access;
    map['PersianName'] = _persianName;
    map['Success'] = _success;
    map['LogStr'] = _logStr;
    return map;
  }

}