import 'package:dio/dio.dart';
import 'package:learn_flutter/service/config.dart';
class HttpRequest{

  static final BaseOptions baseOptions = BaseOptions(
             baseUrl: HttpConfig.baseUrl,
      connectTimeout: HttpConfig.timeout,

             );
//headers: {'token':'111','jwt':'123'}
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,{
                      String method = 'get',
                      Map<String,dynamic> params,
                      Interceptor inter}) async {
    //1.创建单独配置
    final options = Options(method: method);

    //全局拦截器
    //创建默认的全局拦截器
    Interceptor dIter = InterceptorsWrapper(
      onRequest: (options){
        print('请求拦截');
        return options;
      },
      onResponse: (response){
        print('相应拦截');
        return response;
      },
      onError: (err){
        print('错误拦截');
        return err;
      }

    );
    //把默认的拦截器放进数组
    List<Interceptor> inters = [dIter];

    //自定义拦截器如果有的话  就放进去
    if(inter != null){
      inters.add(inter);
    }

    //拦截器统一设置
    dio.interceptors.addAll(inters);

    //2.发送网络请求
    try{
      Response response = await dio.request(url,queryParameters: params,options: options);
      return response.data;
    }on DioError catch(e){
      return Future.error(e);
    }



  }
}