/// Result : {"Success":"True","LogStr":""}
/// TarazAzmayeshiKolList : [{"FLD_COD_TAC":"10","FLD_SCR_HEAD":"46","CFS":"Null","TIF":"Null","S_BED":"0","S_BES":"0","BED":"0","BES":"0"},{"FLD_COD_TAC":"10","FLD_SCR_HEAD":"1","CFS":"0010","TIF":"صندوق","S_BED":"1066400000","S_BES":"1066400000","BED":"0","BES":"0"},{"FLD_COD_TAC":"10","FLD_SCR_HEAD":"5","CFS":"0011","TIF":"اسناد وصولی نزد صندوق","S_BED":"9303470000","S_BES":"10347650000","BED":"0","BES":"1044180000"},{"FLD_COD_TAC":"15","FLD_SCR_HEAD":"8","CFS":"0015","TIF":"تنخواه گردان","S_BED":"10060000","S_BES":"9523000","BED":"537000","BES":"0"},{"FLD_COD_TAC":"20","FLD_SCR_HEAD":"2","CFS":"0020","TIF":"بانکها","S_BED":"220867222518","S_BES":"220867119799","BED":"102719","BES":"0"},{"FLD_COD_TAC":"30","FLD_SCR_HEAD":"6","CFS":"0030","TIF":"حساب اشخاص","S_BED":"357509738545","S_BES":"354223563355","BED":"3286175190","BES":"0"},{"FLD_COD_TAC":"35","FLD_SCR_HEAD":"46","CFS":"0035","TIF":"حسابهای غیرتجاری","S_BED":"0","S_BES":"0","BED":"0","BES":"0"},{"FLD_COD_TAC":"40","FLD_SCR_HEAD":"7","CFS":"0040","TIF":"هزینه ها","S_BED":"6551685904","S_BES":"111086667","BED":"6440599237","BES":"0"},{"FLD_COD_TAC":"45","FLD_SCR_HEAD":"13","CFS":"0045","TIF":"حسابهای انتظامی","S_BED":"0","S_BES":"0","BED":"0","BES":"0"},{"FLD_COD_TAC":"46","FLD_SCR_HEAD":"14","CFS":"0046","TIF":"طرف حسابهای انتظامی","S_BED":"0","S_BES":"0","BED":"0","BES":"0"},{"FLD_COD_TAC":"49","FLD_SCR_HEAD":"17","CFS":"0049","TIF":"سایر بدهیها","S_BED":"1696747171","S_BES":"1946747171","BED":"0","BES":"250000000"},{"FLD_COD_TAC":"50","FLD_SCR_HEAD":"18","CFS":"0050","TIF":"فروش خدمات","S_BED":"204890000","S_BES":"9538882129","BED":"0","BES":"9333992129"},{"FLD_COD_TAC":"51","FLD_SCR_HEAD":"19","CFS":"0051","TIF":"سایر درآمدها","S_BED":"19200000","S_BES":"231507620","BED":"0","BES":"212307620"},{"FLD_COD_TAC":"60","FLD_SCR_HEAD":"21","CFS":"0060","TIF":"اموال و ماشین آلات","S_BED":"0","S_BES":"0","BED":"0","BES":"0"},{"FLD_COD_TAC":"70","FLD_SCR_HEAD":"26","CFS":"0070","TIF":"سرمایه","S_BED":"24512906003","S_BES":"42554246316","BED":"0","BES":"18041340313"},{"FLD_COD_TAC":"72","FLD_SCR_HEAD":"28","CFS":"0072","TIF":"سود (زیان) انباشته","S_BED":"31411701498","S_BES":"3887260227","BED":"27524441271","BES":"0"},{"FLD_COD_TAC":"84","FLD_SCR_HEAD":"38","CFS":"0084","TIF":"تخفیف از فروش","S_BED":"271900455","S_BES":"5","BED":"271900450","BES":"0"},{"FLD_COD_TAC":"85","FLD_SCR_HEAD":"39","CFS":"0085","TIF":"تخفیف از خرید","S_BED":"0","S_BES":"220000","BED":"0","BES":"220000"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"44","CFS":"0090","TIF":"موجودی کالا","S_BED":"252625574879","S_BES":"249925170883","BED":"2700403996","BES":"0"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"40","CFS":"0860","TIF":" برگشت از فروش ","S_BED":"3383200007","S_BES":"0","BED":"3383200007","BES":"0"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"41","CFS":"0870","TIF":" برگشت از خرید ","S_BED":"0","S_BES":"734000000","BED":"0","BES":"734000000"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"42","CFS":"0880","TIF":" قیمت تمام شده برگشت از خرید ","S_BED":"734000000","S_BES":"0","BED":"734000000","BES":"0"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"43","CFS":"0890","TIF":" قیمت تمام شده کالای فروخته شده ","S_BED":"249112703329","S_BES":"3119804058","BED":"245992899271","BES":"0"},{"FLD_COD_TAC":"90","FLD_SCR_HEAD":"45","CFS":"0990","TIF":" فروش ","S_BED":"0","S_BES":"260718219079","BED":"0","BES":"260718219079"}]

class TarazKolModel {
  TarazKolModel({
      Result? result, 
      List<TarazAzmayeshiKolList>? tarazAzmayeshiKolList,}){
    _result = result;
    _tarazAzmayeshiKolList = tarazAzmayeshiKolList;
}

  TarazKolModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['TarazAzmayeshiKolList'] != null) {
      _tarazAzmayeshiKolList = [];
      json['TarazAzmayeshiKolList'].forEach((v) {
        _tarazAzmayeshiKolList?.add(TarazAzmayeshiKolList.fromJson(v));
      });
    }
  }
  Result? _result;
  List<TarazAzmayeshiKolList>? _tarazAzmayeshiKolList;

  Result? get result => _result;
  List<TarazAzmayeshiKolList>? get tarazAzmayeshiKolList => _tarazAzmayeshiKolList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    if (_tarazAzmayeshiKolList != null) {
      map['TarazAzmayeshiKolList'] = _tarazAzmayeshiKolList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_COD_TAC : "10"
/// FLD_SCR_HEAD : "46"
/// CFS : "Null"
/// TIF : "Null"
/// S_BED : "0"
/// S_BES : "0"
/// BED : "0"
/// BES : "0"

class TarazAzmayeshiKolList {
  TarazAzmayeshiKolList({
      String? fldcodtac, 
      String? fldscrhead, 
      String? cfs, 
      String? tif, 
      String? sbed, 
      String? sbes, 
      String? bed, 
      String? bes,}){
    _fldcodtac = fldcodtac;
    _fldscrhead = fldscrhead;
    _cfs = cfs;
    _tif = tif;
    _sbed = sbed;
    _sbes = sbes;
    _bed = bed;
    _bes = bes;
}

  TarazAzmayeshiKolList.fromJson(dynamic json) {
    _fldcodtac = json['FLD_COD_TAC'];
    _fldscrhead = json['FLD_SCR_HEAD'];
    _cfs = json['CFS'];
    _tif = json['TIF'];
    _sbed = json['S_BED'];
    _sbes = json['S_BES'];
    _bed = json['BED'];
    _bes = json['BES'];
  }
  String? _fldcodtac;
  String? _fldscrhead;
  String? _cfs;
  String? _tif;
  String? _sbed;
  String? _sbes;
  String? _bed;
  String? _bes;

  String? get fldcodtac => _fldcodtac;
  String? get fldscrhead => _fldscrhead;
  String? get cfs => _cfs;
  String? get tif => _tif;
  String? get sbed => _sbed;
  String? get sbes => _sbes;
  String? get bed => _bed;
  String? get bes => _bes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_COD_TAC'] = _fldcodtac;
    map['FLD_SCR_HEAD'] = _fldscrhead;
    map['CFS'] = _cfs;
    map['TIF'] = _tif;
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