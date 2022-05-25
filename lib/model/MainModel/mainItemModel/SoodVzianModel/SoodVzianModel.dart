/// Result : {"Success":"True","LogStr":""}
/// SoodZianList_o : {"Docswithproblemlist":[{"fld_tozihat":"","fld_dono_doc":""}],"ZeroQuantityList":[{"fld_cod_lfac":"","fld_cod_inv":"","FLD_DONO_DOC":"","fld_tif_lfac":"","cfs":"","fld_cfs_inv":""}],"SoodZianList":[{"FLD_COD":"90","CFS":"0990","HesabF_Desc":" فروش ","HesabE_Desc":"فروش ","fld_scr_head":"45","fld_prc_acc":"-260718219079","sort":"1","fld_knd_head":"-1"},{"FLD_COD":"90","CFS":"0860","HesabF_Desc":" برگشت از فروش ","HesabE_Desc":"برگشت از فروش ","fld_scr_head":"40","fld_prc_acc":"3383200007","sort":"2","fld_knd_head":"0"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"-9538882129","sort":"3","fld_knd_head":"1"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"204890000","sort":"4","fld_knd_head":"1"},{"FLD_COD":"51","CFS":"0051","HesabF_Desc":"سایر درآمدها","HesabE_Desc":"سایر درآمدها","fld_scr_head":"19","fld_prc_acc":"-212307620","sort":"5","fld_knd_head":"-1"},{"FLD_COD":"84","CFS":"0084","HesabF_Desc":"تخفیف از فروش","HesabE_Desc":"تخفیف از فروش","fld_scr_head":"38","fld_prc_acc":"271900450","sort":"6","fld_knd_head":"1"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"7.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"100","fld_prc_acc":"-266609418371","sort":"8","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"8.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0890","HesabF_Desc":" قیمت تمام شده کالای فروخته شده ","HesabE_Desc":"قیمت تمام شده کالای فروخته شده ","fld_scr_head":"43","fld_prc_acc":"245992899271","sort":"9","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"10.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"200","fld_prc_acc":"-20616519100","sort":"11","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"11.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0870","HesabF_Desc":" برگشت از خرید ","HesabE_Desc":"برگشت از خرید ","fld_scr_head":"41","fld_prc_acc":"-734000000","sort":"12","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0880","HesabF_Desc":" قیمت تمام شده برگشت از خرید ","HesabE_Desc":"قیمت تمام شده برگشت از خرید ","fld_scr_head":"42","fld_prc_acc":"734000000","sort":"13","fld_knd_head":"0"},{"FLD_COD":"40","CFS":"0040","HesabF_Desc":"هزینه ها","HesabE_Desc":"هزینه ها","fld_scr_head":"7","fld_prc_acc":"6440599237","sort":"14","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"14.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"300","fld_prc_acc":"-14175919863","sort":"15","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"17.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"400","fld_prc_acc":"-14175919863","sort":"18","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"18.5","fld_knd_head":"0"}]}

class SoodVzianModel {
  SoodVzianModel({
      Result? result, 
      SoodZianListO? soodZianListO,}){
    _result = result;
    _soodZianListO = soodZianListO;
}

  SoodVzianModel.fromJson(dynamic json) {
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    _soodZianListO = SoodZianListO.fromJson(json['SoodZianList_o']);
  }
  Result? _result;
  SoodZianListO? _soodZianListO;

  Result? get result => _result;
  SoodZianListO? get soodZianListO => _soodZianListO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    map['SoodZianList_o'] = _soodZianListO;
    return map;
  }

}

/// Docswithproblemlist : [{"fld_tozihat":"","fld_dono_doc":""}]
/// ZeroQuantityList : [{"fld_cod_lfac":"","fld_cod_inv":"","FLD_DONO_DOC":"","fld_tif_lfac":"","cfs":"","fld_cfs_inv":""}]
/// SoodZianList : [{"FLD_COD":"90","CFS":"0990","HesabF_Desc":" فروش ","HesabE_Desc":"فروش ","fld_scr_head":"45","fld_prc_acc":"-260718219079","sort":"1","fld_knd_head":"-1"},{"FLD_COD":"90","CFS":"0860","HesabF_Desc":" برگشت از فروش ","HesabE_Desc":"برگشت از فروش ","fld_scr_head":"40","fld_prc_acc":"3383200007","sort":"2","fld_knd_head":"0"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"-9538882129","sort":"3","fld_knd_head":"1"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"204890000","sort":"4","fld_knd_head":"1"},{"FLD_COD":"51","CFS":"0051","HesabF_Desc":"سایر درآمدها","HesabE_Desc":"سایر درآمدها","fld_scr_head":"19","fld_prc_acc":"-212307620","sort":"5","fld_knd_head":"-1"},{"FLD_COD":"84","CFS":"0084","HesabF_Desc":"تخفیف از فروش","HesabE_Desc":"تخفیف از فروش","fld_scr_head":"38","fld_prc_acc":"271900450","sort":"6","fld_knd_head":"1"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"7.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"100","fld_prc_acc":"-266609418371","sort":"8","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"8.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0890","HesabF_Desc":" قیمت تمام شده کالای فروخته شده ","HesabE_Desc":"قیمت تمام شده کالای فروخته شده ","fld_scr_head":"43","fld_prc_acc":"245992899271","sort":"9","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"10.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"200","fld_prc_acc":"-20616519100","sort":"11","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"11.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0870","HesabF_Desc":" برگشت از خرید ","HesabE_Desc":"برگشت از خرید ","fld_scr_head":"41","fld_prc_acc":"-734000000","sort":"12","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0880","HesabF_Desc":" قیمت تمام شده برگشت از خرید ","HesabE_Desc":"قیمت تمام شده برگشت از خرید ","fld_scr_head":"42","fld_prc_acc":"734000000","sort":"13","fld_knd_head":"0"},{"FLD_COD":"40","CFS":"0040","HesabF_Desc":"هزینه ها","HesabE_Desc":"هزینه ها","fld_scr_head":"7","fld_prc_acc":"6440599237","sort":"14","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"14.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"300","fld_prc_acc":"-14175919863","sort":"15","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"17.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"400","fld_prc_acc":"-14175919863","sort":"18","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"18.5","fld_knd_head":"0"}]

class SoodZianListO {
  SoodZianListO({
      List<Docswithproblemlist>? docswithproblemlist,
      List<ZeroQuantityList>? zeroQuantityList, 
      List<SoodZianList>? soodZianList,}){
    _docswithproblemlist = docswithproblemlist;
    _zeroQuantityList = zeroQuantityList;
    _soodZianList = soodZianList;
}

  SoodZianListO.fromJson(dynamic json) {
    if (json['Docswithproblemlist'] != null) {
      _docswithproblemlist = [];
      json['Docswithproblemlist'].forEach((v) {
        _docswithproblemlist?.add(Docswithproblemlist.fromJson(v));
      });
    }
    if (json['ZeroQuantityList'] != null) {
      _zeroQuantityList = [];
      json['ZeroQuantityList'].forEach((v) {
        _zeroQuantityList?.add(ZeroQuantityList.fromJson(v));
      });
    }
    if (json['SoodZianList'] != null) {
      _soodZianList = [];
      json['SoodZianList'].forEach((v) {
        _soodZianList?.add(SoodZianList.fromJson(v));
      });
    }
  }
  List<Docswithproblemlist>? _docswithproblemlist;
  List<ZeroQuantityList>? _zeroQuantityList;
  List<SoodZianList>? _soodZianList;

  List<Docswithproblemlist>? get docswithproblemlist => _docswithproblemlist;
  List<ZeroQuantityList>? get zeroQuantityList => _zeroQuantityList;
  List<SoodZianList>? get soodZianList => _soodZianList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_docswithproblemlist != null) {
      map['Docswithproblemlist'] = _docswithproblemlist?.map((v) => v.toJson()).toList();
    }
    if (_zeroQuantityList != null) {
      map['ZeroQuantityList'] = _zeroQuantityList?.map((v) => v.toJson()).toList();
    }
    if (_soodZianList != null) {
      map['SoodZianList'] = _soodZianList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FLD_COD : "90"
/// CFS : "0990"
/// HesabF_Desc : " فروش "
/// HesabE_Desc : "فروش "
/// fld_scr_head : "45"
/// fld_prc_acc : "-260718219079"
/// sort : "1"
/// fld_knd_head : "-1"

class SoodZianList {
  SoodZianList({
      String? fldcod, 
      String? cfs, 
      String? hesabFDesc, 
      String? hesabEDesc, 
      String? fldScrHead, 
      String? fldPrcAcc, 
      String? sort, 
      String? fldKndHead,}){
    _fldcod = fldcod;
    _cfs = cfs;
    _hesabFDesc = hesabFDesc;
    _hesabEDesc = hesabEDesc;
    _fldScrHead = fldScrHead;
    _fldPrcAcc = fldPrcAcc;
    _sort = sort;
    _fldKndHead = fldKndHead;
}

  SoodZianList.fromJson(dynamic json) {
    _fldcod = json['FLD_COD'];
    _cfs = json['CFS'];
    _hesabFDesc = json['HesabF_Desc'];
    _hesabEDesc = json['HesabE_Desc'];
    _fldScrHead = json['fld_scr_head'];
    _fldPrcAcc = json['fld_prc_acc'];
    _sort = json['sort'];
    _fldKndHead = json['fld_knd_head'];
  }
  String? _fldcod;
  String? _cfs;
  String? _hesabFDesc;
  String? _hesabEDesc;
  String? _fldScrHead;
  String? _fldPrcAcc;
  String? _sort;
  String? _fldKndHead;

  String? get fldcod => _fldcod;
  String? get cfs => _cfs;
  String? get hesabFDesc => _hesabFDesc;
  String? get hesabEDesc => _hesabEDesc;
  String? get fldScrHead => _fldScrHead;
  String? get fldPrcAcc => _fldPrcAcc;
  String? get sort => _sort;
  String? get fldKndHead => _fldKndHead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FLD_COD'] = _fldcod;
    map['CFS'] = _cfs;
    map['HesabF_Desc'] = _hesabFDesc;
    map['HesabE_Desc'] = _hesabEDesc;
    map['fld_scr_head'] = _fldScrHead;
    map['fld_prc_acc'] = _fldPrcAcc;
    map['sort'] = _sort;
    map['fld_knd_head'] = _fldKndHead;
    return map;
  }

}

/// fld_cod_lfac : ""
/// fld_cod_inv : ""
/// FLD_DONO_DOC : ""
/// fld_tif_lfac : ""
/// cfs : ""
/// fld_cfs_inv : ""

class ZeroQuantityList {
  ZeroQuantityList({
      String? fldCodLfac, 
      String? fldCodInv, 
      String? flddonodoc, 
      String? fldTifLfac, 
      String? cfs, 
      String? fldCfsInv,}){
    _fldCodLfac = fldCodLfac;
    _fldCodInv = fldCodInv;
    _flddonodoc = flddonodoc;
    _fldTifLfac = fldTifLfac;
    _cfs = cfs;
    _fldCfsInv = fldCfsInv;
}

  ZeroQuantityList.fromJson(dynamic json) {
    _fldCodLfac = json['fld_cod_lfac'];
    _fldCodInv = json['fld_cod_inv'];
    _flddonodoc = json['FLD_DONO_DOC'];
    _fldTifLfac = json['fld_tif_lfac'];
    _cfs = json['cfs'];
    _fldCfsInv = json['fld_cfs_inv'];
  }
  String? _fldCodLfac;
  String? _fldCodInv;
  String? _flddonodoc;
  String? _fldTifLfac;
  String? _cfs;
  String? _fldCfsInv;

  String? get fldCodLfac => _fldCodLfac;
  String? get fldCodInv => _fldCodInv;
  String? get flddonodoc => _flddonodoc;
  String? get fldTifLfac => _fldTifLfac;
  String? get cfs => _cfs;
  String? get fldCfsInv => _fldCfsInv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fld_cod_lfac'] = _fldCodLfac;
    map['fld_cod_inv'] = _fldCodInv;
    map['FLD_DONO_DOC'] = _flddonodoc;
    map['fld_tif_lfac'] = _fldTifLfac;
    map['cfs'] = _cfs;
    map['fld_cfs_inv'] = _fldCfsInv;
    return map;
  }

}

/// fld_tozihat : ""
/// fld_dono_doc : ""

class Docswithproblemlist {
  Docswithproblemlist({
      String? fldTozihat, 
      String? fldDonoDoc,}){
    _fldTozihat = fldTozihat;
    _fldDonoDoc = fldDonoDoc;
}

  Docswithproblemlist.fromJson(dynamic json) {
    _fldTozihat = json['fld_tozihat'];
    _fldDonoDoc = json['fld_dono_doc'];
  }
  String? _fldTozihat;
  String? _fldDonoDoc;

  String? get fldTozihat => _fldTozihat;
  String? get fldDonoDoc => _fldDonoDoc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fld_tozihat'] = _fldTozihat;
    map['fld_dono_doc'] = _fldDonoDoc;
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