import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}


class GoodsListBean {
  GoodsListBean({
    this.errno,
    this.data,
    this.errmsg,
  });


  factory GoodsListBean.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:GoodsListBean(errno : asT<int>(jsonRes['errno']),
    data : GoodsListData.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])),
    errmsg : asT<String>(jsonRes['errmsg']),
  );

  int errno;
  GoodsListData data;
  String errmsg;

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
class GoodsListData {
  GoodsListData({
    this.total,
    this.pages,
    this.limit,
    this.page,
    this.list,
    this.filterCategoryList,
  });


  factory GoodsListData.fromJson(Map<String, dynamic> jsonRes){ if(jsonRes == null){return null;}
  final List<GoodsListItem> list = jsonRes['list'] is List ? <GoodsListItem>[]: null;
  if(list!=null) {
    for (final dynamic item in jsonRes['list']) { if (item != null) { list.add(GoodsListItem.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<FilterCategoryListItem> filterCategoryList = jsonRes['filterCategoryList'] is List ? <FilterCategoryListItem>[]: null;
  if(filterCategoryList!=null) {
    for (final dynamic item in jsonRes['filterCategoryList']) { if (item != null) { filterCategoryList.add(FilterCategoryListItem.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  return GoodsListData(total : asT<int>(jsonRes['total']),
    pages : asT<int>(jsonRes['pages']),
    limit : asT<int>(jsonRes['limit']),
    page : asT<int>(jsonRes['page']),
    list:list,
    filterCategoryList:filterCategoryList,
  );}

  int total;
  int pages;
  int limit;
  int page;
  List<GoodsListItem> list;
  List<FilterCategoryListItem> filterCategoryList;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'total': total,
    'pages': pages,
    'limit': limit,
    'page': page,
    'list': list,
    'filterCategoryList': filterCategoryList,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}
class GoodsListItem {
  GoodsListItem({
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  });


  factory GoodsListItem.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:GoodsListItem(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    brief : asT<String>(jsonRes['brief']),
    picUrl : asT<String>(jsonRes['picUrl']),
    isNew : asT<bool>(jsonRes['isNew']),
    isHot : asT<bool>(jsonRes['isHot']),
    counterPrice : asT<double>(jsonRes['counterPrice']),
    retailPrice : asT<double>(jsonRes['retailPrice']),
  );

  int id;
  String name;
  String brief;
  String picUrl;
  bool isNew;
  bool isHot;
  double counterPrice;
  double retailPrice;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'brief': brief,
    'picUrl': picUrl,
    'isNew': isNew,
    'isHot': isHot,
    'counterPrice': counterPrice,
    'retailPrice': retailPrice,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class FilterCategoryListItem {
  FilterCategoryListItem({
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


  factory FilterCategoryListItem.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:FilterCategoryListItem(id : asT<int>(jsonRes['id']),
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



