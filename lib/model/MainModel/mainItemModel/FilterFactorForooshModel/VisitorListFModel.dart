/// Result : {"Success":"True","LogStr":""}
/// VisitorList : [{"FLD_Cod_selc":"","Fld_Tif_lfac":""}]

class VisitorListFModel {
  VisitorListFModel({
      Result? result, 
      List<VisitorList>? visitorList,}){
    _result = result;
    _visitorList = visitorList;
}

  VisitorListFModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['VisitorList'] != null) {
      _visitorList = [];
      json['VisitorList'].forEach((v) {
        _visitorList?.add(VisitorList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<VisitorList>? _visitorList;

  Result? get result => _result;
  List<VisitorList>? get visitorList => _visitorList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_visitorList != null) {
      map['VisitorList'] = _visitorList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_Cod_selc : ""
/// Fld_Tif_lfac : ""

class VisitorList {
  VisitorList({
      String? fLDCodSelc, 
      String? fldTifLfac,}){
    _fLDCodSelc = fLDCodSelc;
    _fldTifLfac = fldTifLfac;
}

  VisitorList.fromJson(dynamic json) {
    _fLDCodSelc = json['FLD_Cod_selc'];
    _fldTifLfac = json['Fld_Tif_lfac'];
  }
  String? _fLDCodSelc;
  String? _fldTifLfac;

  String? get fLDCodSelc => _fLDCodSelc;
  String? get fldTifLfac => _fldTifLfac;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_Cod_selc'] = _fLDCodSelc;
    map['Fld_Tif_lfac'] = _fldTifLfac;
    return map;
  }

}

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

  String? get success => _success;
  String? get logStr => _logStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = _success;
    map['LogStr'] = _logStr;
    return map;
  }

}