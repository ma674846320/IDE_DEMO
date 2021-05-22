class TestFunction{
  Function function = Function();
  void start(){
    print(function.sum(1, 2));
    function.anonymousFunction();
  }
}


class Function{
  /// 方法的构成
  /// 返回值 + 方法名 + 参数
  int sum(int val1, int val2){
    return val1 + val2;
  }

  /// 私有方法: 只能在当前文件内调用的方法
  _learn(){
    print('私有方法');
  }

  anonymousFunction(){
    var list = ['私有方法', '匿名方法'];
    list.forEach((element) {
      print(list.indexOf(element).toString()+':'+element);
    });
  }
}