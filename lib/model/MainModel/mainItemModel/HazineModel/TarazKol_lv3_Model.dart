
class TarazKolLv3Model {
  TarazKolLv3Model({
      Result? result, 
      List<TarazAzmayeshiKolMoeinTafsiliList>? tarazAzmayeshiKolMoeinTafsiliList,}){
    _result = result;
    _tarazAzmayeshiKolMoeinTafsiliList = tarazAzmayeshiKolMoeinTafsiliList;
}

  TarazKolLv3Model.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['TarazAzmayeshiKol_Moein_TafsiliList'] != null) {
      _tarazAzmayeshiKolMoeinTafsiliList = [];
      json['TarazAzmayeshiKol_Moein_TafsiliList'].forEach((v) {
        _tarazAzmayeshiKolMoeinTafsiliList?.add(TarazAzmayeshiKolMoeinTafsiliList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<TarazAzmayeshiKolMoeinTafsiliList>? _tarazAzmayeshiKolMoeinTafsiliList;

  Result? get result => _result;
  List<TarazAzmayeshiKolMoeinTafsiliList>? get tarazAzmayeshiKolMoeinTafsiliList => _tarazAzmayeshiKolMoeinTafsiliList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_tarazAzmayeshiKolMoeinTafsiliList != null) {
      map['TarazAzmayeshiKol_Moein_TafsiliList'] = _tarazAzmayeshiKolMoeinTafsiliList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_NO_LVL : "1"
/// FLD_SCR_HEAD : "1"
/// FLD_PARENT_ID : "Null"
/// FLD_COD_LFAC : "1"
/// CFS : "11/10/0010/0001/0001"
/// TIF : "صندوق"
/// FLD_IS_LAST : "1"
/// S_BED : "1066400000"
/// S_BES : "1066400000"
/// BED : "0"
/// BES : "0"

class TarazAzmayeshiKolMoeinTafsiliList {
  TarazAzmayeshiKolMoeinTafsiliList({
      String? fldnolvl, 
      String? fldscrhead, 
      String? fldparentid, 
      String? fldcodlfac, 
      String? cfs, 
      String? tif, 
      String? fldislast, 
      String? sbed, 
      String? sbes, 
      String? bed, 
      String? bes,}){
    _fldnolvl = fldnolvl;
    _fldscrhead = fldscrhead;
    _fldparentid = fldparentid;
    _fldcodlfac = fldcodlfac;
    _cfs = cfs;
    _tif = tif;
    _fldislast = fldislast;
    _sbed = sbed;
    _sbes = sbes;
    _bed = bed;
    _bes = bes;
}

  TarazAzmayeshiKolMoeinTafsiliList.fromJson(dynamic json) {
    _fldnolvl = json['FLD_NO_LVL'];
    _fldscrhead = json['FLD_SCR_HEAD'];
    _fldparentid = json['FLD_PARENT_ID'];
    _fldcodlfac = json['FLD_COD_LFAC'];
    _cfs = json['CFS'];
    _tif = json['TIF'];
    _fldislast = json['FLD_IS_LAST'];
    _sbed = json['S_BED'];
    _sbes = json['S_BES'];
    _bed = json['BED'];
    _bes = json['BES'];
  }
  String? _fldnolvl;
  String? _fldscrhead;
  String? _fldparentid;
  String? _fldcodlfac;
  String? _cfs;
  String? _tif;
  String? _fldislast;
  String? _sbed;
  String? _sbes;
  String? _bed;
  String? _bes;

  String? get fldnolvl => _fldnolvl;
  String? get fldscrhead => _fldscrhead;
  String? get fldparentid => _fldparentid;
  String? get fldcodlfac => _fldcodlfac;
  String? get cfs => _cfs;
  String? get tif => _tif;
  String? get fldislast => _fldislast;
  String? get sbed => _sbed;
  String? get sbes => _sbes;
  String? get bed => _bed;
  String? get bes => _bes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_NO_LVL'] = _fldnolvl;
    map['FLD_SCR_HEAD'] = _fldscrhead;
    map['FLD_PARENT_ID'] = _fldparentid;
    map['FLD_COD_LFAC'] = _fldcodlfac;
    map['CFS'] = _cfs;
    map['TIF'] = _tif;
    map['FLD_IS_LAST'] = _fldislast;
    map['S_BED'] = _sbed;
    map['S_BES'] = _sbes;
    map['BED'] = _bed;
    map['BES'] = _bes;
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