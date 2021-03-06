import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  int? a=333;
  static const shuguo = ['刘备', '关羽', '张飞', '诸葛亮', '黄忠', '赵云'];
  static const weiguo = ['曹操', '曹丕', '夏侯渊', '夏侯惇', '郭嘉'];

  List<Widget> _show(String name, Color color, List list) {
    return list
        .map((e) => Chip(
      label: Text(e),
      avatar: CircleAvatar(
        child: Text(name, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
      ),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Locale locale=Locale("a","b");
    Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "西藏网信版",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("西藏网信办"),
          leading: const Icon(Icons.menu),
          elevation: 0,
          centerTitle: true,
          actions: const [Icon(Icons.settings)],
        ),
        body: Center(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                children: _show("蜀", Colors.red, shuguo),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 5,
                children: _show("魏", Colors.blue, weiguo),
              ),
              Image.asset('image/log/girl.jpg'),
              Image.network('https://img0.baidu.com/it/u=931492032,3770340733&fm=26&fmt=auto')
            ],
          ),
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

