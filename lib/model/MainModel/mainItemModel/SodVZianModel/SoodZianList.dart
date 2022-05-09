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
SoodZianList copyWith({  String? fldcod,
  String? cfs,
  String? hesabFDesc,
  String? hesabEDesc,
  String? fldScrHead,
  String? fldPrcAcc,
  String? sort,
  String? fldKndHead,
}) => SoodZianList(  fldcod: fldcod ?? _fldcod,
  cfs: cfs ?? _cfs,
  hesabFDesc: hesabFDesc ?? _hesabFDesc,
  hesabEDesc: hesabEDesc ?? _hesabEDesc,
  fldScrHead: fldScrHead ?? _fldScrHead,
  fldPrcAcc: fldPrcAcc ?? _fldPrcAcc,
  sort: sort ?? _sort,
  fldKndHead: fldKndHead ?? _fldKndHead,
);
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