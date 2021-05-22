///面向对象的编程技巧
///封装 继承 多态

void main(){
  List list;
  /// 安全的调用
  /// 对于不确定是否为空的对象可以通过?.的方式来访问它的属性和方法以防止空异常如: a?.foo()
  print(list?.length);

  /// 设置默认值
  print(list?.length??-1);//善用??设置默认值

  ///
  list=[];
  list.add(0);
  list.add(null);
  list.add('');

  if(list[0]==null||list[0]==''||list[0]==0) {
      print('list[0] is empyt');
  }
  if([null, 0, ''].contains(list[0])) {
      print('list[0] is empyt1');
  }
}