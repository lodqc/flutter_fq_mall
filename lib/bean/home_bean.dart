import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}


class HomeBean {
  HomeBean({
    this.errno,
    this.data,
    this.errmsg,
  });


  factory HomeBean.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeBean(errno : asT<int>(jsonRes['errno']),
    data : HomeData.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])),
    errmsg : asT<String>(jsonRes['errmsg']),
  );

  int errno;
  HomeData data;
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
class HomeData {
  HomeData({
    this.newGoodsList,
    this.couponList,
    this.channel,
    this.grouponList,
    this.banner,
    this.brandList,
    this.hotGoodsList,
    this.topicList,
    this.floorGoodsList,
  });


  factory HomeData.fromJson(Map<String, dynamic> jsonRes){ if(jsonRes == null){return null;}
  final List<HomeNewGoodsList> newGoodsList = jsonRes['newGoodsList'] is List ? <HomeNewGoodsList>[]: null;
  if(newGoodsList!=null) {
    for (final dynamic item in jsonRes['newGoodsList']) { if (item != null) { newGoodsList.add(HomeNewGoodsList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeCouponList> couponList = jsonRes['couponList'] is List ? <HomeCouponList>[]: null;
  if(couponList!=null) {
    for (final dynamic item in jsonRes['couponList']) { if (item != null) { couponList.add(HomeCouponList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeChannel> channel = jsonRes['channel'] is List ? <HomeChannel>[]: null;
  if(channel!=null) {
    for (final dynamic item in jsonRes['channel']) { if (item != null) { channel.add(HomeChannel.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeGrouponList> grouponList = jsonRes['grouponList'] is List ? <HomeGrouponList>[]: null;
  if(grouponList!=null) {
    for (final dynamic item in jsonRes['grouponList']) { if (item != null) { grouponList.add(HomeGrouponList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeBanner> banner = jsonRes['banner'] is List ? <HomeBanner>[]: null;
  if(banner!=null) {
    for (final dynamic item in jsonRes['banner']) { if (item != null) { banner.add(HomeBanner.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeBrandList> brandList = jsonRes['brandList'] is List ? <HomeBrandList>[]: null;
  if(brandList!=null) {
    for (final dynamic item in jsonRes['brandList']) { if (item != null) { brandList.add(HomeBrandList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeHotGoodsList> hotGoodsList = jsonRes['hotGoodsList'] is List ? <HomeHotGoodsList>[]: null;
  if(hotGoodsList!=null) {
    for (final dynamic item in jsonRes['hotGoodsList']) { if (item != null) { hotGoodsList.add(HomeHotGoodsList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeTopicList> topicList = jsonRes['topicList'] is List ? <HomeTopicList>[]: null;
  if(topicList!=null) {
    for (final dynamic item in jsonRes['topicList']) { if (item != null) { topicList.add(HomeTopicList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  final List<HomeFloorGoodsList> floorGoodsList = jsonRes['floorGoodsList'] is List ? <HomeFloorGoodsList>[]: null;
  if(floorGoodsList!=null) {
    for (final dynamic item in jsonRes['floorGoodsList']) { if (item != null) { floorGoodsList.add(HomeFloorGoodsList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  return HomeData( newGoodsList:newGoodsList,
    couponList:couponList,
    channel:channel,
    grouponList:grouponList,
    banner:banner,
    brandList:brandList,
    hotGoodsList:hotGoodsList,
    topicList:topicList,
    floorGoodsList:floorGoodsList,
  );}

  List<HomeNewGoodsList> newGoodsList;
  List<HomeCouponList> couponList;
  List<HomeChannel> channel;
  List<HomeGrouponList> grouponList;
  List<HomeBanner> banner;
  List<HomeBrandList> brandList;
  List<HomeHotGoodsList> hotGoodsList;
  List<HomeTopicList> topicList;
  List<HomeFloorGoodsList> floorGoodsList;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'newGoodsList': newGoodsList,
    'couponList': couponList,
    'channel': channel,
    'grouponList': grouponList,
    'banner': banner,
    'brandList': brandList,
    'hotGoodsList': hotGoodsList,
    'topicList': topicList,
    'floorGoodsList': floorGoodsList,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}
class HomeNewGoodsList {
  HomeNewGoodsList({
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  });


  factory HomeNewGoodsList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeNewGoodsList(id : asT<int>(jsonRes['id']),
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

class HomeCouponList {
  HomeCouponList({
    this.id,
    this.name,
    this.desc,
    this.tag,
    this.discount,
    this.min,
    this.days,
  });


  factory HomeCouponList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeCouponList(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    desc : asT<String>(jsonRes['desc']),
    tag : asT<String>(jsonRes['tag']),
    discount : asT<double>(jsonRes['discount']),
    min : asT<double>(jsonRes['min']),
    days : asT<int>(jsonRes['days']),
  );

  int id;
  String name;
  String desc;
  String tag;
  double discount;
  double min;
  int days;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'desc': desc,
    'tag': tag,
    'discount': discount,
    'min': min,
    'days': days,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeChannel {
  HomeChannel({
    this.id,
    this.name,
    this.iconUrl,
  });


  factory HomeChannel.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeChannel(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    iconUrl : asT<String>(jsonRes['iconUrl']),
  );

  int id;
  String name;
  String iconUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'iconUrl': iconUrl,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeGrouponList {
  HomeGrouponList({
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.counterPrice,
    this.retailPrice,
    this.grouponPrice,
    this.grouponDiscount,
    this.grouponMember,
  });


  factory HomeGrouponList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeGrouponList(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    brief : asT<String>(jsonRes['brief']),
    picUrl : asT<String>(jsonRes['picUrl']),
    counterPrice : asT<double>(jsonRes['counterPrice']),
    retailPrice : asT<double>(jsonRes['retailPrice']),
    grouponPrice : asT<double>(jsonRes['grouponPrice']),
    grouponDiscount : asT<int>(jsonRes['grouponDiscount']),
    grouponMember : asT<int>(jsonRes['grouponMember']),
  );

  int id;
  String name;
  String brief;
  String picUrl;
  double counterPrice;
  double retailPrice;
  double grouponPrice;
  int grouponDiscount;
  int grouponMember;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'brief': brief,
    'picUrl': picUrl,
    'counterPrice': counterPrice,
    'retailPrice': retailPrice,
    'grouponPrice': grouponPrice,
    'grouponDiscount': grouponDiscount,
    'grouponMember': grouponMember,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeBanner {
  HomeBanner({
    this.id,
    this.name,
    this.link,
    this.url,
    this.position,
    this.content,
    this.enabled,
    this.addTime,
    this.updateTime,
    this.deleted,
  });


  factory HomeBanner.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeBanner(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    link : asT<String>(jsonRes['link']),
    url : asT<String>(jsonRes['url']),
    position : asT<int>(jsonRes['position']),
    content : asT<String>(jsonRes['content']),
    enabled : asT<bool>(jsonRes['enabled']),
    addTime : asT<String>(jsonRes['addTime']),
    updateTime : asT<String>(jsonRes['updateTime']),
    deleted : asT<bool>(jsonRes['deleted']),
  );

  int id;
  String name;
  String link;
  String url;
  int position;
  String content;
  bool enabled;
  String addTime;
  String updateTime;
  bool deleted;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'link': link,
    'url': url,
    'position': position,
    'content': content,
    'enabled': enabled,
    'addTime': addTime,
    'updateTime': updateTime,
    'deleted': deleted,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeBrandList {
  HomeBrandList({
    this.id,
    this.name,
    this.desc,
    this.picUrl,
    this.floorPrice,
  });


  factory HomeBrandList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeBrandList(id : asT<int>(jsonRes['id']),
    name : asT<String>(jsonRes['name']),
    desc : asT<String>(jsonRes['desc']),
    picUrl : asT<String>(jsonRes['picUrl']),
    floorPrice : asT<double>(jsonRes['floorPrice']),
  );

  int id;
  String name;
  String desc;
  String picUrl;
  double floorPrice;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'desc': desc,
    'picUrl': picUrl,
    'floorPrice': floorPrice,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeHotGoodsList {
  HomeHotGoodsList({
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  });


  factory HomeHotGoodsList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeHotGoodsList(id : asT<int>(jsonRes['id']),
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

class HomeTopicList {
  HomeTopicList({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.readCount,
    this.picUrl,
  });


  factory HomeTopicList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeTopicList(id : asT<int>(jsonRes['id']),
    title : asT<String>(jsonRes['title']),
    subtitle : asT<String>(jsonRes['subtitle']),
    price : asT<double>(jsonRes['price']),
    readCount : asT<String>(jsonRes['readCount']),
    picUrl : asT<String>(jsonRes['picUrl']),
  );

  int id;
  String title;
  String subtitle;
  double price;
  String readCount;
  String picUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'price': price,
    'readCount': readCount,
    'picUrl': picUrl,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}

class HomeFloorGoodsList {
  HomeFloorGoodsList({
    this.name,
    this.goodsList,
    this.id,
  });


  factory HomeFloorGoodsList.fromJson(Map<String, dynamic> jsonRes){ if(jsonRes == null){return null;}
  final List<HomeGoodsList> goodsList = jsonRes['goodsList'] is List ? <HomeGoodsList>[]: null;
  if(goodsList!=null) {
    for (final dynamic item in jsonRes['goodsList']) { if (item != null) { goodsList.add(HomeGoodsList.fromJson(asT<Map<String,dynamic>>(item)));  } }
  }


  return HomeFloorGoodsList(name : asT<String>(jsonRes['name']),
    goodsList:goodsList,
    id : asT<int>(jsonRes['id']),
  );}

  String name;
  List<HomeGoodsList> goodsList;
  int id;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'goodsList': goodsList,
    'id': id,
  };

  @override
  String  toString() {
    return json.encode(this);
  }
}
class HomeGoodsList {
  HomeGoodsList({
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  });


  factory HomeGoodsList.fromJson(Map<String, dynamic> jsonRes)=>jsonRes == null? null:HomeGoodsList(id : asT<int>(jsonRes['id']),
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




