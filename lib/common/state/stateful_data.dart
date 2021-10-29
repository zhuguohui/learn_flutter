import 'package:flutter/cupertino.dart';

typedef UpdateFun<T>(StatefulData<T> newData);

///数据和状态的整体
class StatefulData<T> {
  final T? data;
  final Exception? exception;
  final UIState uiState;
  final String optionName;
  var updateFun;
  final bool callUpdate;

  ///该方法是内部使用。初始化使用get这个命名构造函数
  @protected
  StatefulData(
      this.uiState, this.data, this.optionName, this.exception, this.updateFun,
      [this.callUpdate = true]) {
    if (updateFun != null && callUpdate) {
      updateFun(this);
    }
  }

  StatefulData.get(String optionName, UpdateFun<T> updateFun)
      : this(UIState.loading, null, optionName, null, updateFun, false);

  StatefulData<T> success(T data) =>
      StatefulData(UIState.success, data, optionName, null, updateFun);

  StatefulData<T> loading() =>
      StatefulData(UIState.loading, null, optionName, null, updateFun);

  StatefulData<T> error(Exception error) =>
      StatefulData(UIState.error, null, optionName, error, updateFun);

  StatefulData<T> empty() =>
      StatefulData(UIState.empty, null, optionName, null, updateFun);
}

enum UIState { success, error, loading, empty }
