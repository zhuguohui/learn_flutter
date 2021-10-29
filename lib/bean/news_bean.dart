class NewsPage {
  NewsPage({
    required this.channels,
    required this.docs,
  });
  late final List<Channels> channels;
  late final Docs docs;

  NewsPage.fromJson(Map<String, dynamic> json){
    channels = List.from(json['channels']).map((e)=>Channels.fromJson(e)).toList();
    docs = Docs.fromJson(json['docs']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['channels'] = channels.map((e)=>e.toJson()).toList();
    _data['docs'] = docs.toJson();
    return _data;
  }
}

class Channels {
  Channels({
    required this.channelId,
    required this.channelUrl,
    required this.appChannelDesc,
    required this.channelCode,
    required this.firstScreen,
    required this.isFixed,
    required this.channelLogo,
    required this.channelType,
    required this.linkUrl,
    required this.hasChildren,
    required this.channelComment,
  });
  late final String channelId;
  late final String channelUrl;
  late final String appChannelDesc;
  late final String channelCode;
  late final String firstScreen;
  late final String isFixed;
  late final List<String> channelLogo;
  late final String channelType;
  late final String linkUrl;
  late final String hasChildren;
  late final String channelComment;

  Channels.fromJson(Map<String, dynamic> json){
    channelId = json['channelId'];
    channelUrl = json['channelUrl'];
    appChannelDesc = json['appChannelDesc'];
    channelCode = json['channelCode'];
    firstScreen = json['firstScreen'];
    isFixed = json['isFixed'];
    channelLogo = List.castFrom<dynamic, String>(json['channelLogo']);
    channelType = json['channelType'];
    linkUrl = json['linkUrl'];
    hasChildren = json['hasChildren'];
    channelComment = json['channelComment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['channelId'] = channelId;
    _data['channelUrl'] = channelUrl;
    _data['appChannelDesc'] = appChannelDesc;
    _data['channelCode'] = channelCode;
    _data['firstScreen'] = firstScreen;
    _data['isFixed'] = isFixed;
    _data['channelLogo'] = channelLogo;
    _data['channelType'] = channelType;
    _data['linkUrl'] = linkUrl;
    _data['hasChildren'] = hasChildren;
    _data['channelComment'] = channelComment;
    return _data;
  }
}

class Docs {
  Docs({
    required this.focuses,
    required this.pager,
    required this.list,
  });
  late final List<Focuses> focuses;
  late final Pager pager;
  late final List<NewsItem> list;

  Docs.fromJson(Map<String, dynamic> json){
    focuses = List.from(json['focuses']).map((e)=>Focuses.fromJson(e)).toList();
    pager = Pager.fromJson(json['pager']);
    list = List.from(json['list']).map((e)=>NewsItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['focuses'] = focuses.map((e)=>e.toJson()).toList();
    _data['pager'] = pager.toJson();
    _data['list'] = list.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Focuses {
  Focuses({
    required this.docId,
    required this.docType,
    required this.docUrl,
    required this.focusImageTitle,
    required this.focusImageUrl,
    required this.pubTime,
    required this.label,
    required this.linkUrl,
    required this.h5Url,
    required this.shareUrl,
    required this.commentSet,
    required this.likeSet,
  });
  late final String docId;
  late final String docType;
  late final String docUrl;
  late final String focusImageTitle;
  late final String focusImageUrl;
  late final String pubTime;
  late final String label;
  late final String linkUrl;
  late final String h5Url;
  late final String shareUrl;
  late final String commentSet;
  late final String likeSet;

  Focuses.fromJson(Map<String, dynamic> json){
    docId = json['docId'];
    docType = json['docType'];
    docUrl = json['docUrl'];
    focusImageTitle = json['focusImageTitle'];
    focusImageUrl = json['focusImageUrl'];
    pubTime = json['pubTime'];
    label = json['label'];
    linkUrl = json['linkUrl'];
    h5Url = json['h5Url'];
    shareUrl = json['shareUrl'];
    commentSet = json['commentSet'];
    likeSet = json['likeSet'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['docId'] = docId;
    _data['docType'] = docType;
    _data['docUrl'] = docUrl;
    _data['focusImageTitle'] = focusImageTitle;
    _data['focusImageUrl'] = focusImageUrl;
    _data['pubTime'] = pubTime;
    _data['label'] = label;
    _data['linkUrl'] = linkUrl;
    _data['h5Url'] = h5Url;
    _data['shareUrl'] = shareUrl;
    _data['commentSet'] = commentSet;
    _data['likeSet'] = likeSet;
    return _data;
  }
}

class Pager {
  Pager({
    required this.pageIndex,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });
  late final int pageIndex;
  late final int pageSize;
  late final int pageCount;
  late final int total;

  Pager.fromJson(Map<String, dynamic> json){
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pageIndex'] = pageIndex;
    _data['pageSize'] = pageSize;
    _data['pageCount'] = pageCount;
    _data['total'] = total;
    return _data;
  }
}

class NewsItem {
  NewsItem({
    required this.docId,
    required this.docType,
    required this.docUrl,
    required this.docTitle,
    required this.source,
    required this.label,
    required this.listStyle,
    required this.listTitle,
    required this.imgUrls,
    required this.cardImageUrl,
    required this.pubTime,
    required this.author,
    required this.commentSet,
    required this.likeSet,
    required this.live,
    required this.video,
    required this.audio,
    required this.channel,
    required this.linkUrl,
    required this.h5Url,
    required this.hasChildren,
    required this.channelCode,
    required this.shareUrl,
  });
  late final String docId;
  late final String docType;
  late final String docUrl;
  late final String docTitle;
  late final String source;
  late final String label;
  late final String listStyle;
  late final String listTitle;
  late final List<String> imgUrls;
  late final String cardImageUrl;
  late final String pubTime;
  late final String author;
  late final String commentSet;
  late final String likeSet;
  late final Live live;
  late final Video video;
  late final Audio audio;
  late final Channel channel;
  late final String linkUrl;
  late final String h5Url;
  late final String hasChildren;
  late final String channelCode;
  late final String shareUrl;

  NewsItem.fromJson(Map<String, dynamic> json){
    docId = json['docId'];
    docType = json['docType'];
    docUrl = json['docUrl'];
    docTitle = json['docTitle'];
    source = json['source'];
    label = json['label'];
    listStyle = json['listStyle'];
    listTitle = json['listTitle'];
    imgUrls = List.castFrom<dynamic, String>(json['imgUrls']);
    cardImageUrl = json['cardImageUrl'];
    pubTime = json['pubTime'];
    author = json['author'];
    commentSet = json['commentSet'];
    likeSet = json['likeSet'];
    live = Live.fromJson(json['live']);
    video = Video.fromJson(json['video']);
    audio = Audio.fromJson(json['audio']);
    channel = Channel.fromJson(json['channel']);
    linkUrl = json['linkUrl'];
    h5Url = json['h5Url'];
    hasChildren = json['hasChildren'];
    channelCode = json['channelCode'];
    shareUrl = json['shareUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['docId'] = docId;
    _data['docType'] = docType;
    _data['docUrl'] = docUrl;
    _data['docTitle'] = docTitle;
    _data['source'] = source;
    _data['label'] = label;
    _data['listStyle'] = listStyle;
    _data['listTitle'] = listTitle;
    _data['imgUrls'] = imgUrls;
    _data['cardImageUrl'] = cardImageUrl;
    _data['pubTime'] = pubTime;
    _data['author'] = author;
    _data['commentSet'] = commentSet;
    _data['likeSet'] = likeSet;
    _data['live'] = live.toJson();
    _data['video'] = video.toJson();
    _data['audio'] = audio.toJson();
    _data['channel'] = channel.toJson();
    _data['linkUrl'] = linkUrl;
    _data['h5Url'] = h5Url;
    _data['hasChildren'] = hasChildren;
    _data['channelCode'] = channelCode;
    _data['shareUrl'] = shareUrl;
    return _data;
  }
}

class Live {
  Live({
    required this.liveDuration,
    required this.url,
  });
  late final LiveDuration liveDuration;
  late final String url;

  Live.fromJson(Map<String, dynamic> json){
    liveDuration = LiveDuration.fromJson(json['liveDuration']);
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['liveDuration'] = liveDuration.toJson();
    _data['url'] = url;
    return _data;
  }
}

class LiveDuration {
  LiveDuration({
    required this.startTime,
    required this.endTime,
  });
  late final String startTime;
  late final String endTime;

  LiveDuration.fromJson(Map<String, dynamic> json){
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    return _data;
  }
}

class Video {
  Video();

Video.fromJson(Map<String, dynamic> json){
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  return _data;
}
}

class Audio {
  Audio();

Audio.fromJson(Map<String, dynamic> json){
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  return _data;
}
}

class Channel {
  Channel({
    required this.channelId,
    required this.channelTitle,
    required this.channelNav,
  });
  late final String channelId;
  late final String channelTitle;
  late final String channelNav;

  Channel.fromJson(Map<String, dynamic> json){
    channelId = json['channelId'];
    channelTitle = json['channelTitle'];
    channelNav = json['channelNav'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['channelId'] = channelId;
    _data['channelTitle'] = channelTitle;
    _data['channelNav'] = channelNav;
    return _data;
  }
}