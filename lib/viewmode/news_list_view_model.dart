import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/bean/news_bean.dart';
import 'package:learn_flutter/common/state/stateful_data.dart';
import 'package:learn_flutter/config/net_address.dart';

///用来控制新闻显示逻辑的ViewModel
class NewsListViewModel extends ChangeNotifier{
    late  StatefulData<NewsPage>  data;
    Dio  dio=  Dio();

    NewsListViewModel(){
      data=StatefulData.get("获取新闻列表",(newData){
        data.updateFun=null;
        data=newData;
        notifyListeners();
      });
      loadNewsList();
    }

    ///加载新闻列表
    loadNewsList() async{
      data.loading();
      try{
        Response response=  await dio.get(NetAddress.URL_NEWS_LIST);
        NewsPage newsPage=NewsPage.fromJson(response.data);
        if(newsPage.docs.list.isEmpty){
          //数据为空
          data.empty();
        }else{
          data.success(newsPage);
        }
      }catch(e){
        data.error(e as Exception);
      }
    }

}

