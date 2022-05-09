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
ZeroQuantityList copyWith({  String? fldCodLfac,
  String? fldCodInv,
  String? flddonodoc,
  String? fldTifLfac,
  String? cfs,
  String? fldCfsInv,
}) => ZeroQuantityList(  fldCodLfac: fldCodLfac ?? _fldCodLfac,
  fldCodInv: fldCodInv ?? _fldCodInv,
  flddonodoc: flddonodoc ?? _flddonodoc,
  fldTifLfac: fldTifLfac ?? _fldTifLfac,
  cfs: cfs ?? _cfs,
  fldCfsInv: fldCfsInv ?? _fldCfsInv,
);
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