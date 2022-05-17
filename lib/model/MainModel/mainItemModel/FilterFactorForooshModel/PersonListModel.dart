

class PersonListModel {
  PersonListModel({
      Result? result, 
      List<PersonList>? personList,}){
    _result = result;
    _personList = personList;
}

  PersonListModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['PersonList'] != null) {
      _personList = [];
      json['PersonList'].forEach((v) {
        _personList?.add(PersonList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<PersonList>? _personList;

  Result? get result => _result;
  List<PersonList>? get personList => _personList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_personList != null) {
      map['PersonList'] = _personList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_Cod_LFAC : "13"
/// fld_tif_lfac : "آقاي احمد احمد پور"
/// fld_nmmf_per : "Null"
/// PRC : "Null"
/// FLD_ADF_PER : "Null"
/// FLD_PHN1_PER : "09181600310"
/// FLD_PHN2_PER : "Null"
/// FLD_PHN3_PER : "Null"
/// FLD_BIT_BADHESAB : "Null"
/// FLD_BIT_KHOSHHESAB : "Null"
/// CFS : "0030/0001/0001"

class PersonList {
  PersonList({
      String? fLDCodLFAC, 
      String? fldTifLfac, 
      String? fldNmmfPer, 
      String? prc, 
      String? fldadfper, 
      String? fldphn1per, 
      String? fldphn2per, 
      String? fldphn3per, 
      String? fldbitbadhesab, 
      String? fldbitkhoshhesab, 
      String? cfs,}){
    _fLDCodLFAC = fLDCodLFAC;
    _fldTifLfac = fldTifLfac;
    _fldNmmfPer = fldNmmfPer;
    _prc = prc;
    _fldadfper = fldadfper;
    _fldphn1per = fldphn1per;
    _fldphn2per = fldphn2per;
    _fldphn3per = fldphn3per;
    _fldbitbadhesab = fldbitbadhesab;
    _fldbitkhoshhesab = fldbitkhoshhesab;
    _cfs = cfs;
}

  PersonList.fromJson(dynamic json) {
    _fLDCodLFAC = json['FLD_Cod_LFAC'];
    _fldTifLfac = json['fld_tif_lfac'];
    _fldNmmfPer = json['fld_nmmf_per'];
    _prc = json['PRC'];
    _fldadfper = json['FLD_ADF_PER'];
    _fldphn1per = json['FLD_PHN1_PER'];
    _fldphn2per = json['FLD_PHN2_PER'];
    _fldphn3per = json['FLD_PHN3_PER'];
    _fldbitbadhesab = json['FLD_BIT_BADHESAB'];
    _fldbitkhoshhesab = json['FLD_BIT_KHOSHHESAB'];
    _cfs = json['CFS'];
  }
  String? _fLDCodLFAC;
  String? _fldTifLfac;
  String? _fldNmmfPer;
  String? _prc;
  String? _fldadfper;
  String? _fldphn1per;
  String? _fldphn2per;
  String? _fldphn3per;
  String? _fldbitbadhesab;
  String? _fldbitkhoshhesab;
  String? _cfs;

  String? get fLDCodLFAC => _fLDCodLFAC;
  String? get fldTifLfac => _fldTifLfac;
  String? get fldNmmfPer => _fldNmmfPer;
  String? get prc => _prc;
  String? get fldadfper => _fldadfper;
  String? get fldphn1per => _fldphn1per;
  String? get fldphn2per => _fldphn2per;
  String? get fldphn3per => _fldphn3per;
  String? get fldbitbadhesab => _fldbitbadhesab;
  String? get fldbitkhoshhesab => _fldbitkhoshhesab;
  String? get cfs => _cfs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_Cod_LFAC'] = _fLDCodLFAC;
    map['fld_tif_lfac'] = _fldTifLfac;
    map['fld_nmmf_per'] = _fldNmmfPer;
    map['PRC'] = _prc;
    map['FLD_ADF_PER'] = _fldadfper;
    map['FLD_PHN1_PER'] = _fldphn1per;
    map['FLD_PHN2_PER'] = _fldphn2per;
    map['FLD_PHN3_PER'] = _fldphn3per;
    map['FLD_BIT_BADHESAB'] = _fldbitbadhesab;
    map['FLD_BIT_KHOSHHESAB'] = _fldbitkhoshhesab;
    map['CFS'] = _cfs;
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