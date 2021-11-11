import 'dart:ui';

class BarMapDataBean {
  BarMapDataBean({
    required this.title,
    required this.barMaps,
  });
  late final String title;
  late final List<BarMaps> barMaps;

  BarMapDataBean.fromJson(Map<String, dynamic> json){
    title = json['title'];
    barMaps = List.from(json['bar_maps']).map((e)=>BarMaps.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['bar_maps'] = barMaps.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BarMaps {
  BarMaps({
    required this.name,
    required this.person,
    required this.money,
    required this.points,
  });
  late final String name;
  late final int person;
  late final int money;
  late final List<String> points;
  Path? path;

  BarMaps.fromJson(Map<String, dynamic> json){
    name = json['name'];
    person = json['person'];
    money = json['money'];
    points = List.castFrom<dynamic, String>(json['points']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['person'] = person;
    _data['money'] = money;
    _data['points'] = points;
    return _data;
  }
}