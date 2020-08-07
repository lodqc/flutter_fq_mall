class Api {
  //static const String BASE_URL = 'http://192.168.190.84:8080/mall-app';
  //static const String BASE_URL = 'http://192.168.190.84:8080';
//  static const String BASE_URL='http://192.168.190.35:8082/wx';
  static const String BASE_URL = 'http://120.25.226.11:8080//mall-app/wx';
  static const String HOME_URL='/home/index';//首页数据
  static const String BANNER_URL = BASE_URL + '/home/banner'; //获取首页banner图
  static const String CATEGORY_URL = BASE_URL + '/home/categories'; //获取首页分类
  static const String COUPON_URL='/home/couponList';//优惠券
  static const String GROUP_BY_URL='/home/groupBuy';//团购专区
  static const String HOME_PRODUCT_URL= '/home/newProduct';//新品
  static const String HOME_HOT_PRODUCT_URL= '/home/hotProduct';//新品
  static const String HOME_FIRST_CATEGORY='/catalog/getfirstcategory';//商品分类第一级
  static const String HOME_SECOND_CATEGORY='/catalog/getsecondcategory';//商品分类第二级
  static const String GOODS_TOTAL_NUMBER='/goods/count';//获取商品总数
  static const String GOODS_CATEGORY_URL='/goods/category/list';//分类下的商品分类
  static const String GOODS_LIST_URL='/goods/list';//分类下的商品列表
  static const String GOODS_DETAILS_URL='/goods/detail';//商品详情
  static const String REGISTER='/auth/register';//注册
  static const String LOGIN='/auth/login';//登录
  static const String ADD_CART='/cart/add';//加入购物车
  static const String FAST_BUY='/cart/fastadd';//立即购买
  static const String COLLECT_ADD_DELETE= '/collect/addordelete'; //添加或取消收藏
  static const String CART_LIST='/cart/index';//购物车数据
  static const String CART_UPDATE='/cart/update';//更新购物车
  static const String CART_DELETE='/cart/delete';//删除购物车数据
  static const String CART_CHECK='/cart/checked';//购物车商品勾选
  static const String CART_BUY='/cart/checkout';//购物车下单
  static const String COUPON_LIST='/coupon/selectlist';//优惠券列表
  static const String ADDRESS_LIST='/address/list';//地址列表
  static const String ADDRESS_SAVE='/address/save';//增加地址
  static const String ADDRESS_DELETE='/address/delete';//删除地址
  static const String ADDRESS_DETAIL='/address/detail';//地址详情
  static const String ORDER='/order';//生成订单
  static const String FEED_BACK='/feedback/submit';//意见反馈
  static const String MINE_COUPON_LIST='/coupon/mylist';//所有优惠券
  static const String MINE_FOOTPRINT='/footprint/list';//足迹
  static const String MINE_FOOTPRINT_DELETE='/footprint/delete';//删除足迹
  static const String MINE_COLLECT= '/collect/list'; //收藏列表
  static const String SUBMIT_ORDER= '/order/submit';// 提交订单
  static const String MINE_ORDERS='/order/list';//我的订单
  static const String MINE_ORDER_DETAIL="/order/detail";//订单详情
  static const String MINE_ORDER_CANCEL="/order/cancel";//取消订单
  static const String MINE_ORDER_DELETE="/order/delete";//取消订单
  static const String SEARCH_GOODS='/search/helper';//商品搜索
  static const String PROJECT_SELECTION_DETAIL='/topic/detail';//专题精选详情
  static const String PROJECT_SELECTION_RECOMMEND='/topic/related';//推荐
  static const String CATEGORY_LIST="/goods/category";//获取分类下的子类
  static const String BRAND_DETAIL="/brand/detail";//品牌制造商详情
  static const String RECEIVE_COUPON="/coupon/receive";//领取优惠券
  static const String LOGIN_OUT="/auth/logout";//退出登录

}
