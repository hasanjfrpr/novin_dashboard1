/// Result : {"Success":"True","LogStr":""}
/// HesabAshkhasList : [{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29129","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969  خريد XIAOMI POCO X3 PRO 256GB گارانتی دی جی سرویس866010055438347","BED":"73000000","BES":"0","SUM_PRC":"73000000","fld_mmf_acc":"1 عدد -  في 73,000,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29133","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969  خريد اسکرین A","BED":"1100000","BES":"0","SUM_PRC":"74100000","fld_mmf_acc":"1 عدد -  في 1,100,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29137","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969  خريد اسکرین لنز دوربین گوشی","BED":"900000","BES":"0","SUM_PRC":"75000000","fld_mmf_acc":"1 عدد -  في 900,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29139","FLD_COD_DOC":"4537","FLD_TIC_ACC":"2","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969 Update","BED":"1200000","BES":"0","SUM_PRC":"76200000","fld_mmf_acc":"1 عدد -  في 1,200,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29823","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969 Antivirus","BED":"1700000","BES":"0","SUM_PRC":"77900000","fld_mmf_acc":"1 عدد -  في 1,700,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29825","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969 MI account","BED":"1900000","BES":"0","SUM_PRC":"79800000","fld_mmf_acc":"1 عدد -  في 1,900,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29827","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":"فاكتور 2969 Program","BED":"1400000","BES":"0","SUM_PRC":"81200000","fld_mmf_acc":"1 عدد -  في 1,400,000 ريال \r"},{"FLD_DODA_DOC":"2021/07/28","FLD_COD_ACC":"29829","FLD_COD_DOC":"4537","FLD_TIC_ACC":"0","FLD_DONO_BASE":"4394","FLD_DONO_DOC":"4377","FLD_DSF_ACC":" پرداخت  حواله [96]","BED":"0","BES":"81200000","SUM_PRC":"0","fld_mmf_acc":" بابت فاكتور 2969"}]

class RizBedBesModel {
  RizBedBesModel({
      Result? result, 
      List<HesabAshkhasList>? hesabAshkhasList,}){
    _result = result;
    _hesabAshkhasList = hesabAshkhasList;
}

  RizBedBesModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['HesabAshkhasList'] != null) {
      _hesabAshkhasList = [];
      json['HesabAshkhasList'].forEach((v) {
        _hesabAshkhasList?.add(HesabAshkhasList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<HesabAshkhasList>? _hesabAshkhasList;

  Result? get result => _result;
  List<HesabAshkhasList>? get hesabAshkhasList => _hesabAshkhasList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_hesabAshkhasList != null) {
      map['HesabAshkhasList'] = _hesabAshkhasList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_DODA_DOC : "2021/07/28"
/// FLD_COD_ACC : "29129"
/// FLD_COD_DOC : "4537"
/// FLD_TIC_ACC : "0"
/// FLD_DONO_BASE : "4394"
/// FLD_DONO_DOC : "4377"
/// FLD_DSF_ACC : "فاكتور 2969  خريد XIAOMI POCO X3 PRO 256GB گارانتی دی جی سرویس866010055438347"
/// BED : "73000000"
/// BES : "0"
/// SUM_PRC : "73000000"
/// fld_mmf_acc : "1 عدد -  في 73,000,000 ريال \r"

class HesabAshkhasList {
  HesabAshkhasList({
      String? flddodadoc, 
      String? fldcodacc, 
      String? fldcoddoc, 
      String? fldticacc, 
      String? flddonobase, 
      String? flddonodoc, 
      String? flddsfacc, 
      String? bed, 
      String? bes, 
      String? sumprc, 
      String? fldMmfAcc,}){
    _flddodadoc = flddodadoc;
    _fldcodacc = fldcodacc;
    _fldcoddoc = fldcoddoc;
    _fldticacc = fldticacc;
    _flddonobase = flddonobase;
    _flddonodoc = flddonodoc;
    _flddsfacc = flddsfacc;
    _bed = bed;
    _bes = bes;
    _sumprc = sumprc;
    _fldMmfAcc = fldMmfAcc;
}

  HesabAshkhasList.fromJson(dynamic json) {
    _flddodadoc = json['FLD_DODA_DOC'];
    _fldcodacc = json['FLD_COD_ACC'];
    _fldcoddoc = json['FLD_COD_DOC'];
    _fldticacc = json['FLD_TIC_ACC'];
    _flddonobase = json['FLD_DONO_BASE'];
    _flddonodoc = json['FLD_DONO_DOC'];
    _flddsfacc = json['FLD_DSF_ACC'];
    _bed = json['BED'];
    _bes = json['BES'];
    _sumprc = json['SUM_PRC'];
    _fldMmfAcc = json['fld_mmf_acc'];
  }
  String? _flddodadoc;
  String? _fldcodacc;
  String? _fldcoddoc;
  String? _fldticacc;
  String? _flddonobase;
  String? _flddonodoc;
  String? _flddsfacc;
  String? _bed;
  String? _bes;
  String? _sumprc;
  String? _fldMmfAcc;

  String? get flddodadoc => _flddodadoc;
  String? get fldcodacc => _fldcodacc;
  String? get fldcoddoc => _fldcoddoc;
  String? get fldticacc => _fldticacc;
  String? get flddonobase => _flddonobase;
  String? get flddonodoc => _flddonodoc;
  String? get flddsfacc => _flddsfacc;
  String? get bed => _bed;
  String? get bes => _bes;
  String? get sumprc => _sumprc;
  String? get fldMmfAcc => _fldMmfAcc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_DODA_DOC'] = _flddodadoc;
    map['FLD_COD_ACC'] = _fldcodacc;
    map['FLD_COD_DOC'] = _fldcoddoc;
    map['FLD_TIC_ACC'] = _fldticacc;
    map['FLD_DONO_BASE'] = _flddonobase;
    map['FLD_DONO_DOC'] = _flddonodoc;
    map['FLD_DSF_ACC'] = _flddsfacc;
    map['BED'] = _bed;
    map['BES'] = _bes;
    map['SUM_PRC'] = _sumprc;
    map['fld_mmf_acc'] = _fldMmfAcc;
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