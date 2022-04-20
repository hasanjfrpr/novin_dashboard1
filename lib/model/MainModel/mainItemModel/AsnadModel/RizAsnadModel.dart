/// Result : {"Success":"True","LogStr":""}
/// DocumentDetailsList : [{"CFS":"0020/0000/0023","fld_dsf_acc":" دريافت  حواله [96]  از غلامی/09165122588","bed":"2200000","bes":"0","fld_tif_lfac":"  0338797585002 صادرات مجتبی احمدی صادرات"},{"CFS":"0090/0022/0047","fld_dsf_acc":"فاكتور 1757  فروش  به غلامی/09165122588","bed":"810677","bes":"0","fld_tif_lfac":"بک کاور iphon/samsung"},{"CFS":"0090/0022/0047","fld_dsf_acc":" فروش  به غلامی/09165122588","bed":"0","bes":"2200000","fld_tif_lfac":"بک کاور iphon/samsung"},{"CFS":"0090/0022/0047","fld_dsf_acc":"فاكتور 1757  فروش  به غلامی/09165122588","bed":"0","bes":"810677","fld_tif_lfac":"بک کاور iphon/samsung"}]

class RizAsnadModel {
  RizAsnadModel({
      Result? result, 
      List<DocumentDetailsList>? documentDetailsList,}){
    _result = result;
    _documentDetailsList = documentDetailsList;
}

  RizAsnadModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['DocumentDetailsList'] != null) {
      _documentDetailsList = [];
      json['DocumentDetailsList'].forEach((v) {
        _documentDetailsList?.add(DocumentDetailsList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<DocumentDetailsList>? _documentDetailsList;

  Result? get result => _result;
  List<DocumentDetailsList>? get documentDetailsList => _documentDetailsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_documentDetailsList != null) {
      map['DocumentDetailsList'] = _documentDetailsList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// CFS : "0020/0000/0023"
/// fld_dsf_acc : " دريافت  حواله [96]  از غلامی/09165122588"
/// bed : "2200000"
/// bes : "0"
/// fld_tif_lfac : "  0338797585002 صادرات مجتبی احمدی صادرات"

class DocumentDetailsList {
  DocumentDetailsList({
      String? cfs, 
      String? fldDsfAcc, 
      String? bed, 
      String? bes, 
      String? fldTifLfac,}){
    _cfs = cfs;
    _fldDsfAcc = fldDsfAcc;
    _bed = bed;
    _bes = bes;
    _fldTifLfac = fldTifLfac;
}

  DocumentDetailsList.fromJson(dynamic json) {
    _cfs = json['CFS'];
    _fldDsfAcc = json['fld_dsf_acc'];
    _bed = json['bed'];
    _bes = json['bes'];
    _fldTifLfac = json['fld_tif_lfac'];
  }
  String? _cfs;
  String? _fldDsfAcc;
  String? _bed;
  String? _bes;
  String? _fldTifLfac;

  String? get cfs => _cfs;
  String? get fldDsfAcc => _fldDsfAcc;
  String? get bed => _bed;
  String? get bes => _bes;
  String? get fldTifLfac => _fldTifLfac;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CFS'] = _cfs;
    map['fld_dsf_acc'] = _fldDsfAcc;
    map['bed'] = _bed;
    map['bes'] = _bes;
    map['fld_tif_lfac'] = _fldTifLfac;
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