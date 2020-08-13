import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
import 'package:flutter_fq_mall/common/net/api.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'retrofit_client.g.dart';
//flutter pub run build_runner build
@RestApi(baseUrl: Api.BASE_URL)
abstract class RetrofitClient {
  factory RetrofitClient({String baseUrl}) {
    Dio dio = new Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 5000;
    dio.options.sendTimeout = 5000;
    dio.options.responseType = ResponseType.json;
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
//      options.queryParameters.addAll({
//        "voice": "false",
//        "app_plat": "android",
//        "mobile_model": "android9",
//        "version": "1.2.2",
//        "token": UserRepository.getInstance().getUser().then((it) => it.token) ?? ""
//      });
//
//      options.data = jsonEncode(options.queryParameters);
      options = buildCacheOptions(Duration(days: 7),
          options: options);
      print("onRequest == ${jsonEncode(options.data)}");
      return options; //continue
    }, onResponse: (Response response) {
//      response.data = json.decode(response.data);
      print("onResponse == ${response.data}");
      return response; // continue
    }, onError: (DioError e) {
      print("onError == ${e.toString()}");
      return e; //continue
    }));
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: Api.BASE_URL)).interceptor);
//     //抓包代理
//     bool isProxyChecked = true; // a variable for debug
//     String proxy = '10.8.0.170:8888'; // ip:port
//     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) {
//         return isProxyChecked && Platform.isAndroid;
//       };
//       client.findProxy = (url) {
//         return isProxyChecked ? 'PROXY $proxy' : 'DIRECT';
//       };
//     };
    return _RetrofitClient(dio, baseUrl: baseUrl);
  }

  @GET(Api.HOME_URL)
  Future<HomeBean> homeIndex();
}
