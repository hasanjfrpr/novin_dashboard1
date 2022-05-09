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
Docswithproblemlist copyWith({  String? fldTozihat,
  String? fldDonoDoc,
}) => Docswithproblemlist(  fldTozihat: fldTozihat ?? _fldTozihat,
  fldDonoDoc: fldDonoDoc ?? _fldDonoDoc,
);
  String? get fldTozihat => _fldTozihat;
  String? get fldDonoDoc => _fldDonoDoc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fld_tozihat'] = _fldTozihat;
    map['fld_dono_doc'] = _fldDonoDoc;
    return map;
  }

}