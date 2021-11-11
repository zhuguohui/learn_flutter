import 'package:flutter/material.dart';
import 'package:learn_flutter/view/bar_map_view.dart';

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "自定义控件",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("西藏网信办"),
          leading: const Icon(Icons.menu),
          elevation: 0,
          centerTitle: true,
          actions: const [Icon(Icons.settings)],
        ),
        body:BarMapView('./assets/map.json'),
      ),
    );
  }
}





