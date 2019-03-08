import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../service/service_url.dart';

Future request(url, formData) async {
  try {
    print("开始获取数据 ... ");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    if (formData==null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    return print("ERROR:========>${e}");
  }
}

//获得首页主题内容
Future getHomePageContent() async {
  try {
    print("开始获取首页数据 ... ");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    var formData = {"lon": "115.02932", "lat": "35.76189"};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    return print("ERROR:========>${e}");
  }
}

//获得火爆专区的商品方法
Future getHomePageBelowContent() async {
  try {
    print("开始获取火爆专区数据 ... ");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    int page = 1;
    response = await dio.post(servicePath['homePageBelowContent'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    return print("ERROR:========>${e}");
  }
}
