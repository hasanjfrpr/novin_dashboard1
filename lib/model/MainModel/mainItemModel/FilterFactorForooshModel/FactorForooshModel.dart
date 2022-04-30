/// Result : {"Success":"True","LogStr":""}
/// FactorForooshList : [{"maliat_forosh":"0","avarez_forosh":"0","fld_prc_acc2":"Null","fld_prc_acc22":"Null","FLD_COD_LFAC":"Null","FLD_TIF_LFAC":"نمونه جمالی باتیستی","FLD_COD_DOC":"5368","FLD_DONO_DOC":"4326","FLD_FANU_DOC":"0.01","FLD_DSF_DOC":"فاكتور 0.01  فروش 1قلم کالا به نمونه جمالی باتیستی","FLD_AMOU_DOC":"4000000","FLD_DODA_DOC":"2021/08/04","fld_sood_lastpurchase":"2648648","fld_sood_average":"0"},{"maliat_forosh":"0","avarez_forosh":"0","fld_prc_acc2":"Null","fld_prc_acc22":"Null","FLD_COD_LFAC":"Null","FLD_TIF_LFAC":"نمونه علیخانی","FLD_COD_DOC":"5370","FLD_DONO_DOC":"5001","FLD_FANU_DOC":"0.02","FLD_DSF_DOC":"فاكتور 0.02  فروش 1قلم کالا به نمونه علیخانی","FLD_AMOU_DOC":"4000000","FLD_DODA_DOC":"2021/08/21","fld_sood_lastpurchase":"2648648","fld_sood_average":"0"}]

class FactorForooshModel {
  FactorForooshModel({
      Result? result, 
      List<FactorForooshList>? factorForooshList,}){
    _result = result;
    _factorForooshList = factorForooshList;
}

  FactorForooshModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['FactorForooshList'] != null) {
      _factorForooshList = [];
      json['FactorForooshList'].forEach((v) {
        _factorForooshList?.add(FactorForooshList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<FactorForooshList>? _factorForooshList;

  void set factorList(List<FactorForooshList> factorList){
    _factorForooshList = factorList;
  }

  Result? get result => _result;
  List<FactorForooshList>? get factorForooshList => _factorForooshList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_factorForooshList != null) {
      map['FactorForooshList'] = _factorForooshList?.map((v) => v.toJson()).toList();
    }
    return map;
  }



}

/// maliat_forosh : "0"
/// avarez_forosh : "0"
/// fld_prc_acc2 : "Null"
/// fld_prc_acc22 : "Null"
/// FLD_COD_LFAC : "Null"
/// FLD_TIF_LFAC : "نمونه جمالی باتیستی"
/// FLD_COD_DOC : "5368"
/// FLD_DONO_DOC : "4326"
/// FLD_FANU_DOC : "0.01"
/// FLD_DSF_DOC : "فاكتور 0.01  فروش 1قلم کالا به نمونه جمالی باتیستی"
/// FLD_AMOU_DOC : "4000000"
/// FLD_DODA_DOC : "2021/08/04"
/// fld_sood_lastpurchase : "2648648"
/// fld_sood_average : "0"

class FactorForooshList {
  FactorForooshList({
      String? maliatForosh, 
      String? avarezForosh, 
      String? fldPrcAcc2, 
      String? fldPrcAcc22, 
      String? fldcodlfac, 
      String? fldtiflfac, 
      String? fldcoddoc, 
      String? flddonodoc, 
      String? fldfanudoc, 
      String? flddsfdoc, 
      String? fldamoudoc, 
      String? flddodadoc, 
      String? fldSoodLastpurchase, 
      String? fldSoodAverage,}){
    _maliatForosh = maliatForosh;
    _avarezForosh = avarezForosh;
    _fldPrcAcc2 = fldPrcAcc2;
    _fldPrcAcc22 = fldPrcAcc22;
    _fldcodlfac = fldcodlfac;
    _fldtiflfac = fldtiflfac;
    _fldcoddoc = fldcoddoc;
    _flddonodoc = flddonodoc;
    _fldfanudoc = fldfanudoc;
    _flddsfdoc = flddsfdoc;
    _fldamoudoc = fldamoudoc;
    _flddodadoc = flddodadoc;
    _fldSoodLastpurchase = fldSoodLastpurchase;
    _fldSoodAverage = fldSoodAverage;
}

  FactorForooshList.fromJson(dynamic json) {
    _maliatForosh = json['maliat_forosh'];
    _avarezForosh = json['avarez_forosh'];
    _fldPrcAcc2 = json['fld_prc_acc2'];
    _fldPrcAcc22 = json['fld_prc_acc22'];
    _fldcodlfac = json['FLD_COD_LFAC'];
    _fldtiflfac = json['FLD_TIF_LFAC'];
    _fldcoddoc = json['FLD_COD_DOC'];
    _flddonodoc = json['FLD_DONO_DOC'];
    _fldfanudoc = json['FLD_FANU_DOC'];
    _flddsfdoc = json['FLD_DSF_DOC'];
    _fldamoudoc = json['FLD_AMOU_DOC'];
    _flddodadoc = json['FLD_DODA_DOC'];
    _fldSoodLastpurchase = json['fld_sood_lastpurchase'];
    _fldSoodAverage = json['fld_sood_average'];
  }
  String? _maliatForosh;
  String? _avarezForosh;
  String? _fldPrcAcc2;
  String? _fldPrcAcc22;
  String? _fldcodlfac;
  String? _fldtiflfac;
  String? _fldcoddoc;
  String? _flddonodoc;
  String? _fldfanudoc;
  String? _flddsfdoc;
  String? _fldamoudoc;
  String? _flddodadoc;
  String? _fldSoodLastpurchase;
  String? _fldSoodAverage;

  String? get maliatForosh => _maliatForosh;
  String? get avarezForosh => _avarezForosh;
  String? get fldPrcAcc2 => _fldPrcAcc2;
  String? get fldPrcAcc22 => _fldPrcAcc22;
  String? get fldcodlfac => _fldcodlfac;
  String? get fldtiflfac => _fldtiflfac;
  String? get fldcoddoc => _fldcoddoc;
  String? get flddonodoc => _flddonodoc;
  String? get fldfanudoc => _fldfanudoc;
  String? get flddsfdoc => _flddsfdoc;
  String? get fldamoudoc => _fldamoudoc;
  String? get flddodadoc => _flddodadoc;
  String? get fldSoodLastpurchase => _fldSoodLastpurchase;
  String? get fldSoodAverage => _fldSoodAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maliat_forosh'] = _maliatForosh;
    map['avarez_forosh'] = _avarezForosh;
    map['fld_prc_acc2'] = _fldPrcAcc2;
    map['fld_prc_acc22'] = _fldPrcAcc22;
    map['FLD_COD_LFAC'] = _fldcodlfac;
    map['FLD_TIF_LFAC'] = _fldtiflfac;
    map['FLD_COD_DOC'] = _fldcoddoc;
    map['FLD_DONO_DOC'] = _flddonodoc;
    map['FLD_FANU_DOC'] = _fldfanudoc;
    map['FLD_DSF_DOC'] = _flddsfdoc;
    map['FLD_AMOU_DOC'] = _fldamoudoc;
    map['FLD_DODA_DOC'] = _flddodadoc;
    map['fld_sood_lastpurchase'] = _fldSoodLastpurchase;
    map['fld_sood_average'] = _fldSoodAverage;
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