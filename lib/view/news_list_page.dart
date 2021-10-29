import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/bean/news_bean.dart';
import 'package:learn_flutter/common/state/stateful_data.dart';
import 'package:learn_flutter/viewmode/news_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NewsListViewModel(),
        )
      ],
      child: Consumer<NewsListViewModel>(
        builder: (ctx, viewModel, child) {
          return Center(child: ShowPage(viewModel));
        },
      ),
    ));
  }
}

class ShowPage extends StatelessWidget {
  NewsListViewModel viewModel;

  ShowPage(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatefulData<NewsPage> data = viewModel.data;
    switch (data.uiState) {
      case UIState.loading:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(), Text("正在" + data.optionName)],
        );

      case UIState.error:
        return InkWell(
            onTap: () => viewModel.loadNewsList(),
            child: Text(
                data.optionName + "出错,点击重试:[${data.exception.toString()}]"));
      case UIState.empty:
        return Text("数据为空");
      case UIState.success:
        return Text("加载成功");
    }
  }
}

