/// Result : {"Success":"True","LogStr":""}
/// AnbarList : [{"Fld_Cod_INV":"1","Fld_CFS_INV":"1","Fld_NMF_INV":"انبار 1"}]

class AnbarModel {
  AnbarModel({
      Result? result, 
      List<AnbarList>? anbarList,}){
    _result = result;
    _anbarList = anbarList;
}

  AnbarModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['AnbarList'] != null) {
      _anbarList = [];
      json['AnbarList'].forEach((v) {
        _anbarList?.add(AnbarList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<AnbarList>? _anbarList;

  Result? get result => _result;
  List<AnbarList>? get anbarList => _anbarList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_anbarList != null) {
      map['AnbarList'] = _anbarList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Fld_Cod_INV : "1"
/// Fld_CFS_INV : "1"
/// Fld_NMF_INV : "انبار 1"

class AnbarList {
  AnbarList({
      String? fldCodINV, 
      String? fldCFSINV, 
      String? fldNMFINV,}){
    _fldCodINV = fldCodINV;
    _fldCFSINV = fldCFSINV;
    _fldNMFINV = fldNMFINV;
}

  AnbarList.fromJson(dynamic json) {
    _fldCodINV = json['Fld_Cod_INV'];
    _fldCFSINV = json['Fld_CFS_INV'];
    _fldNMFINV = json['Fld_NMF_INV'];
  }
  String? _fldCodINV;
  String? _fldCFSINV;
  String? _fldNMFINV;

  String? get fldCodINV => _fldCodINV;
  String? get fldCFSINV => _fldCFSINV;
  String? get fldNMFINV => _fldNMFINV;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fld_Cod_INV'] = _fldCodINV;
    map['Fld_CFS_INV'] = _fldCFSINV;
    map['Fld_NMF_INV'] = _fldNMFINV;
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