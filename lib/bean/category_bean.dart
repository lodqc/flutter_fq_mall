import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}


class CategoryBean {
  CategoryBean({
    this.errno,
    this.data,
    this.errmsg,
  });


  factory CategoryBean.fromJson(Map<String, dynamic> jsonRes){ if(jsonRes == null){return null;}
  final List<CategoryData> data = jsonRes['data'] is List ? <CategoryData>[]: null;
  if(data!=null) {
    for (final dynamic item in jsonRes['data']) { if (item != null) { data.add(CategoryData.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  return CategoryBean(errno : asT<int>(jsonRes['errno']),
    data:data,
    errmsg : asT<String>(jsonRes['errmsg']),
  );}

  int errno;
  List<CategoryData> data;
  String errmsg;
  int index=0;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'errno': errno,
    'data': data,
    'errmsg': errmsg,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}
class CategoryData {
  CategoryData({
    this.id,
    this.name,
    this.keywords,
    this.desc,
    this.pid,
    this.iconUrl,
    this.picUrl,
    this.level,
    this.sortOrder,
    this.addTime,
    this.updateTime,
    this.deleted,
  });


  factory CategoryData.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:CategoryData(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    keywords : asT<String>(jsonRes['keywords']),
    desc : asT<String>(jsonRes['desc']),
    pid : asT<int>(jsonRes['pid']),
    iconUrl : asT<String>(jsonRes['iconUrl']),
    picUrl : asT<String>(jsonRes['picUrl']),
    level : asT<String>(jsonRes['level']),
    sortOrder : asT<int>(jsonRes['sortOrder']),
    addTime : asT<String>(jsonRes['addTime']),
    updateTime : asT<String>(jsonRes['updateTime']),
    deleted : asT<bool>(jsonRes['deleted']),
  );

  int id;
  String name;
  String keywords;
  String desc;
  int pid;
  String iconUrl;
  String picUrl;
  String level;
  int sortOrder;
  String addTime;
  String updateTime;
  bool deleted;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'keywords': keywords,
    'desc': desc,
    'pid': pid,
    'iconUrl': iconUrl,
    'picUrl': picUrl,
    'level': level,
    'sortOrder': sortOrder,
    'addTime': addTime,
    'updateTime': updateTime,
    'deleted': deleted,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}


