/// methodName : "GetBookList"
/// id : "5407"
/// Status : "True"

class BaseSocketModel {
  BaseSocketModel({
      String? methodName, 
      String? id, 
      String? status,}){
    _methodName = methodName;
    _id = id;
    _status = status;
}

  BaseSocketModel.fromJson(dynamic json) {
    _methodName = json['methodName'];
    _id = json['id'];
    _status = json['Status'];
  }
  String? _methodName;
  String? _id;
  String? _status;

  String? get methodName => _methodName;
  String? get id => _id;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['methodName'] = _methodName;
    map['id'] = _id;
    map['Status'] = _status;
    return map;
  }

}