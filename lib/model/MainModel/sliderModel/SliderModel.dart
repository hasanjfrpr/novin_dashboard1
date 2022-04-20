/// img : "https://www.hnovin.com/wp-content/uploads/2020/01/store-Software-Accounting.png"
/// link : "https://www.hnovin.com"

class SliderModel {
  SliderModel({
      String? img, 
      String? link,}){
    _img = img;
    _link = link;
}

  SliderModel.fromJson(dynamic json) {
    _img = json['img'];
    _link = json['link'];
  }
  String? _img;
  String? _link;

  String? get img => _img;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = _img;
    map['link'] = _link;
    return map;
  }

}