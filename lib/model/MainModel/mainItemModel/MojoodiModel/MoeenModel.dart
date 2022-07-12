/// Result : {"Success":"true","LogStr":""}
/// MoeenList : [{"fld_cod_jac":"51","CFS":"0090/0001","FLD_TIF_JAC":"سامسونگ","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"53","CFS":"0090/0003","FLD_TIF_JAC":"آیفون","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"55","CFS":"0090/0005","FLD_TIF_JAC":"هواووی","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"56","CFS":"0090/0006","FLD_TIF_JAC":"ایسوس","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"57","CFS":"0090/0007","FLD_TIF_JAC":"بلک بری","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"59","CFS":"0090/0009","FLD_TIF_JAC":"لنوو","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"61","CFS":"0090/0011","FLD_TIF_JAC":"متفرقه گوشی","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"62","CFS":"0090/0015","FLD_TIF_JAC":"ساعت ","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"63","CFS":"0090/0016","FLD_TIF_JAC":"رم و فلش و هارد ","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"64","CFS":"0090/0017","FLD_TIF_JAC":"هندزفری و هدست جبرا","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"65","CFS":"0090/0018","FLD_TIF_JAC":"اسپیکر","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"66","CFS":"0090/0019","FLD_TIF_JAC":"پاور بانک","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"67","CFS":"0090/0020","FLD_TIF_JAC":"باطری","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"68","CFS":"0090/0021","FLD_TIF_JAC":"کابل و شارژر و مونوپاد","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"69","CFS":"0090/0022","FLD_TIF_JAC":"کاور / کیف / گارد","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"70","CFS":"0090/0023","FLD_TIF_JAC":"اسکرین","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"72","CFS":"0090/0012","FLD_TIF_JAC":"تبلت","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"74","CFS":"0090/0025","FLD_TIF_JAC":"نرم افزار","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"75","CFS":"0090/0026","FLD_TIF_JAC":"پک جانبی ","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"78","CFS":"0090/0010","FLD_TIF_JAC":"نوکیا","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"89","CFS":"0090/0030","FLD_TIF_JAC":"ps4","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"90","CFS":"0090/0031","FLD_TIF_JAC":"بیمه","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"91","CFS":"0090/0032","FLD_TIF_JAC":"بند ساعت/سامسونگ*آیفون","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"97","CFS":"0090/0033","FLD_TIF_JAC":"شیاومی","FLD_TIF_TAC":"موجودی کالا"},{"fld_cod_jac":"98","CFS":"0090/0034","FLD_TIF_JAC":"ال جی","FLD_TIF_TAC":"موجودی کالا"}]
/// methodName : "GetMoeenList"
/// id : "8581"
/// totalpage : "0"
/// Status : "True"

class MoeenModel {
  MoeenModel({
      Result? result, 
      List<MoeenList>? moeenList, 
      String? methodName, 
      String? id, 
      String? totalpage, 
      String? status,}){
    _result = result;
    _moeenList = moeenList;
    _methodName = methodName;
    _id = id;
    _totalpage = totalpage;
    _status = status;
}

  MoeenModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['MoeenList'] != null) {
      _moeenList = [];
      json['MoeenList'].forEach((v) {
        _moeenList?.add(MoeenList.fromJson(v));
      });
    }
    _methodName = json['methodName'];
    _id = json['id'];
    _totalpage = json['totalpage'];
    _status = json['Status'];
  }
  Result? _result;
  List<MoeenList>? _moeenList;
  String? _methodName;
  String? _id;
  String? _totalpage;
  String? _status;

  Result? get result => _result;
  List<MoeenList>? get moeenList => _moeenList;
  String? get methodName => _methodName;
  String? get id => _id;
  String? get totalpage => _totalpage;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_moeenList != null) {
      map['MoeenList'] = _moeenList?.map((v) => v.toJson()).toList();
    }
    map['methodName'] = _methodName;
    map['id'] = _id;
    map['totalpage'] = _totalpage;
    map['Status'] = _status;
    return map;
  }

}

/// fld_cod_jac : "51"
/// CFS : "0090/0001"
/// FLD_TIF_JAC : "سامسونگ"
/// FLD_TIF_TAC : "موجودی کالا"

class MoeenList {
  MoeenList({
      String? fldCodJac, 
      String? cfs, 
      String? fldtifjac, 
      String? fldtiftac,}){
    _fldCodJac = fldCodJac;
    _cfs = cfs;
    _fldtifjac = fldtifjac;
    _fldtiftac = fldtiftac;
}

  MoeenList.fromJson(dynamic json) {
    _fldCodJac = json['fld_cod_jac'];
    _cfs = json['CFS'];
    _fldtifjac = json['FLD_TIF_JAC'];
    _fldtiftac = json['FLD_TIF_TAC'];
  }
  String? _fldCodJac;
  String? _cfs;
  String? _fldtifjac;
  String? _fldtiftac;

  String? get fldCodJac => _fldCodJac;
  String? get cfs => _cfs;
  String? get fldtifjac => _fldtifjac;
  String? get fldtiftac => _fldtiftac;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fld_cod_jac'] = _fldCodJac;
    map['CFS'] = _cfs;
    map['FLD_TIF_JAC'] = _fldtifjac;
    map['FLD_TIF_TAC'] = _fldtiftac;
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