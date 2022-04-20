/// Result : {"Success":"True","LogStr":""}
/// FactorForooshRizKalaList : [{"FLD_SCR_ACC":"180","CFS":"0090/0001/0482","FLD_TIF_LFAC":"SAMSUNG A52 A525 4G 128GB گارانتی دی جی سرویس","FLD_TIE_LFAC":"Null","FLD_QTY1_IOGDS":"1","FLD_SPRC_IOGDS":"119000000","FLD_TPRC_IOGDS":"119000000","FLD_prcDISC_IOGDS":"0","SUM_TPRC_IOGDS":"119000000","SUM_PRCDISC_IOGDS":"0","Price_After_Discount":"119000000"}]

class RizFactorModel {
  RizFactorModel({
      Result? result, 
      List<FactorForooshRizKalaList>? factorForooshRizKalaList,}){
    _result = result;
    _factorForooshRizKalaList = factorForooshRizKalaList;
}

  RizFactorModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['FactorForooshRizKalaList'] != null) {
      _factorForooshRizKalaList = [];
      json['FactorForooshRizKalaList'].forEach((v) {
        _factorForooshRizKalaList?.add(FactorForooshRizKalaList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<FactorForooshRizKalaList>? _factorForooshRizKalaList;

  Result? get result => _result;
  List<FactorForooshRizKalaList>? get factorForooshRizKalaList => _factorForooshRizKalaList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_factorForooshRizKalaList != null) {
      map['FactorForooshRizKalaList'] = _factorForooshRizKalaList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_SCR_ACC : "180"
/// CFS : "0090/0001/0482"
/// FLD_TIF_LFAC : "SAMSUNG A52 A525 4G 128GB گارانتی دی جی سرویس"
/// FLD_TIE_LFAC : "Null"
/// FLD_QTY1_IOGDS : "1"
/// FLD_SPRC_IOGDS : "119000000"
/// FLD_TPRC_IOGDS : "119000000"
/// FLD_prcDISC_IOGDS : "0"
/// SUM_TPRC_IOGDS : "119000000"
/// SUM_PRCDISC_IOGDS : "0"
/// Price_After_Discount : "119000000"

class FactorForooshRizKalaList {
  FactorForooshRizKalaList({
      String? fldscracc, 
      String? cfs, 
      String? fldtiflfac, 
      String? fldtielfac, 
      String? fldqty1iogds, 
      String? fldsprciogds, 
      String? fldtprciogds, 
      String? fLDPrcDISCIOGDS, 
      String? sumtprciogds, 
      String? sumprcdisciogds, 
      String? priceAfterDiscount,}){
    _fldscracc = fldscracc;
    _cfs = cfs;
    _fldtiflfac = fldtiflfac;
    _fldtielfac = fldtielfac;
    _fldqty1iogds = fldqty1iogds;
    _fldsprciogds = fldsprciogds;
    _fldtprciogds = fldtprciogds;
    _fLDPrcDISCIOGDS = fLDPrcDISCIOGDS;
    _sumtprciogds = sumtprciogds;
    _sumprcdisciogds = sumprcdisciogds;
    _priceAfterDiscount = priceAfterDiscount;
}

  FactorForooshRizKalaList.fromJson(dynamic json) {
    _fldscracc = json['FLD_SCR_ACC'];
    _cfs = json['CFS'];
    _fldtiflfac = json['FLD_TIF_LFAC'];
    _fldtielfac = json['FLD_TIE_LFAC'];
    _fldqty1iogds = json['FLD_QTY1_IOGDS'];
    _fldsprciogds = json['FLD_SPRC_IOGDS'];
    _fldtprciogds = json['FLD_TPRC_IOGDS'];
    _fLDPrcDISCIOGDS = json['FLD_prcDISC_IOGDS'];
    _sumtprciogds = json['SUM_TPRC_IOGDS'];
    _sumprcdisciogds = json['SUM_PRCDISC_IOGDS'];
    _priceAfterDiscount = json['Price_After_Discount'];
  }
  String? _fldscracc;
  String? _cfs;
  String? _fldtiflfac;
  String? _fldtielfac;
  String? _fldqty1iogds;
  String? _fldsprciogds;
  String? _fldtprciogds;
  String? _fLDPrcDISCIOGDS;
  String? _sumtprciogds;
  String? _sumprcdisciogds;
  String? _priceAfterDiscount;

  String? get fldscracc => _fldscracc;
  String? get cfs => _cfs;
  String? get fldtiflfac => _fldtiflfac;
  String? get fldtielfac => _fldtielfac;
  String? get fldqty1iogds => _fldqty1iogds;
  String? get fldsprciogds => _fldsprciogds;
  String? get fldtprciogds => _fldtprciogds;
  String? get fLDPrcDISCIOGDS => _fLDPrcDISCIOGDS;
  String? get sumtprciogds => _sumtprciogds;
  String? get sumprcdisciogds => _sumprcdisciogds;
  String? get priceAfterDiscount => _priceAfterDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_SCR_ACC'] = _fldscracc;
    map['CFS'] = _cfs;
    map['FLD_TIF_LFAC'] = _fldtiflfac;
    map['FLD_TIE_LFAC'] = _fldtielfac;
    map['FLD_QTY1_IOGDS'] = _fldqty1iogds;
    map['FLD_SPRC_IOGDS'] = _fldsprciogds;
    map['FLD_TPRC_IOGDS'] = _fldtprciogds;
    map['FLD_prcDISC_IOGDS'] = _fLDPrcDISCIOGDS;
    map['SUM_TPRC_IOGDS'] = _sumtprciogds;
    map['SUM_PRCDISC_IOGDS'] = _sumprcdisciogds;
    map['Price_After_Discount'] = _priceAfterDiscount;
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