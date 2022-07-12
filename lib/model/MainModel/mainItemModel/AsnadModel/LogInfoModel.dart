/// Result : {"Success":"true","LogStr":""}
/// LogInfoList : [{"fld_nmf_user":"","kind":"درج کردن","datem":"1/24/2022 9:23:07 PM"}]
/// SStatus : "no method available"
/// methodName : "GetLogInfo"
/// id : "1634"
/// totalpage : "0"
/// Status : "True"

class LogInfoModel {
  LogInfoModel({
      Result? result, 
      List<LogInfoList>? logInfoList, 
      String? sStatus, 
      String? methodName, 
      String? id, 
      String? totalpage, 
      String? status,}){
    _result = result;
    _logInfoList = logInfoList;
    _sStatus = sStatus;
    _methodName = methodName;
    _id = id;
    _totalpage = totalpage;
    _status = status;
}

  LogInfoModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['LogInfoList'] != null) {
      _logInfoList = [];
      json['LogInfoList'].forEach((v) {
        _logInfoList?.add(LogInfoList.fromJson(v));
      });
    }
    _sStatus = json['SStatus'];
    _methodName = json['methodName'];
    _id = json['id'];
    _totalpage = json['totalpage'];
    _status = json['Status'];
  }
  Result? _result;
  List<LogInfoList>? _logInfoList;
  String? _sStatus;
  String? _methodName;
  String? _id;
  String? _totalpage;
  String? _status;

  Result? get result => _result;
  List<LogInfoList>? get logInfoList => _logInfoList;
  String? get sStatus => _sStatus;
  String? get methodName => _methodName;
  String? get id => _id;
  String? get totalpage => _totalpage;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_logInfoList != null) {
      map['LogInfoList'] = _logInfoList?.map((v) => v.toJson()).toList();
    }
    map['SStatus'] = _sStatus;
    map['methodName'] = _methodName;
    map['id'] = _id;
    map['totalpage'] = _totalpage;
    map['Status'] = _status;
    return map;
  }

}

/// fld_nmf_user : ""
/// kind : "درج کردن"
/// datem : "1/24/2022 9:23:07 PM"

class LogInfoList {
  LogInfoList({
      String? fldNmfUser, 
      String? kind, 
      String? datem,}){
    _fldNmfUser = fldNmfUser;
    _kind = kind;
    _datem = datem;
}

  LogInfoList.fromJson(dynamic json) {
    _fldNmfUser = json['fld_nmf_user'];
    _kind = json['kind'];
    _datem = json['datem'];
  }
  String? _fldNmfUser;
  String? _kind;
  String? _datem;

  String? get fldNmfUser => _fldNmfUser;
  String? get kind => _kind;
  String? get datem => _datem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fld_nmf_user'] = _fldNmfUser;
    map['kind'] = _kind;
    map['datem'] = _datem;
    return map;
  }

}

/// Success : "true"
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

  String? get success => _success;
  String? get logStr => _logStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = _success;
    map['LogStr'] = _logStr;
    return map;
  }

}