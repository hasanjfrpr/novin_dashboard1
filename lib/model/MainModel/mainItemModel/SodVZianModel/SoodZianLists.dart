import 'package:novin_dashboard1/model/MainModel/mainItemModel/SodVZianModel/Docswithproblemlist.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/SodVZianModel/SoodZianList.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/SodVZianModel/ZeroQuantityList.dart';

/// Docswithproblemlist : [{"fld_tozihat":"","fld_dono_doc":""}]
/// ZeroQuantityList : [{"fld_cod_lfac":"","fld_cod_inv":"","FLD_DONO_DOC":"","fld_tif_lfac":"","cfs":"","fld_cfs_inv":""}]
/// SoodZianList : [{"FLD_COD":"90","CFS":"0990","HesabF_Desc":" فروش ","HesabE_Desc":"فروش ","fld_scr_head":"45","fld_prc_acc":"-260718219079","sort":"1","fld_knd_head":"-1"},{"FLD_COD":"90","CFS":"0860","HesabF_Desc":" برگشت از فروش ","HesabE_Desc":"برگشت از فروش ","fld_scr_head":"40","fld_prc_acc":"3383200007","sort":"2","fld_knd_head":"0"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"-9538882129","sort":"3","fld_knd_head":"1"},{"FLD_COD":"50","CFS":"0050","HesabF_Desc":"فروش خدمات","HesabE_Desc":"فروش خدمات","fld_scr_head":"18","fld_prc_acc":"204890000","sort":"4","fld_knd_head":"1"},{"FLD_COD":"51","CFS":"0051","HesabF_Desc":"سایر درآمدها","HesabE_Desc":"سایر درآمدها","fld_scr_head":"19","fld_prc_acc":"-212307620","sort":"5","fld_knd_head":"-1"},{"FLD_COD":"84","CFS":"0084","HesabF_Desc":"تخفیف از فروش","HesabE_Desc":"تخفیف از فروش","fld_scr_head":"38","fld_prc_acc":"271900450","sort":"6","fld_knd_head":"1"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"7.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"100","fld_prc_acc":"-266609418371","sort":"8","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"8.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0890","HesabF_Desc":" قیمت تمام شده کالای فروخته شده ","HesabE_Desc":"قیمت تمام شده کالای فروخته شده ","fld_scr_head":"43","fld_prc_acc":"245992899271","sort":"9","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"10.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"200","fld_prc_acc":"-20616519100","sort":"11","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"11.5","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0870","HesabF_Desc":" برگشت از خرید ","HesabE_Desc":"برگشت از خرید ","fld_scr_head":"41","fld_prc_acc":"-734000000","sort":"12","fld_knd_head":"0"},{"FLD_COD":"90","CFS":"0880","HesabF_Desc":" قیمت تمام شده برگشت از خرید ","HesabE_Desc":"قیمت تمام شده برگشت از خرید ","fld_scr_head":"42","fld_prc_acc":"734000000","sort":"13","fld_knd_head":"0"},{"FLD_COD":"40","CFS":"0040","HesabF_Desc":"هزینه ها","HesabE_Desc":"هزینه ها","fld_scr_head":"7","fld_prc_acc":"6440599237","sort":"14","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"14.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"300","fld_prc_acc":"-14175919863","sort":"15","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"17.5","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"400","fld_prc_acc":"-14175919863","sort":"18","fld_knd_head":"0"},{"FLD_COD":"1000","CFS":"Null","HesabF_Desc":"Null","HesabE_Desc":"Null","fld_scr_head":"0","fld_prc_acc":"0","sort":"18.5","fld_knd_head":"0"}]

class SoodZianLists {
  SoodZianLists({
      List<Docswithproblemlist>? docswithproblemlist, 
      List<ZeroQuantityList>? zeroQuantityList, 
      List<SoodZianList>? soodZianList,}){
    _docswithproblemlist = docswithproblemlist;
    _zeroQuantityList = zeroQuantityList;
    _soodZianList = soodZianList;
}

  SoodZianLists.fromJson(dynamic json) {
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
SoodZianLists copyWith({  List<Docswithproblemlist>? docswithproblemlist,
  List<ZeroQuantityList>? zeroQuantityList,
  List<SoodZianList>? soodZianList,
}) => SoodZianLists(  docswithproblemlist: docswithproblemlist ?? _docswithproblemlist,
  zeroQuantityList: zeroQuantityList ?? _zeroQuantityList,
  soodZianList: soodZianList ?? _soodZianList,
);
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