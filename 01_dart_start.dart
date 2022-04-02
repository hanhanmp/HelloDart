//变量https://dart.cn/samples#variables
void variables() {
  /*var的使用
  用var声明的变量可以接收任何类型的变量
  如若用var声明的变量的同时为其赋某一类型的值，则该变量就固定类型，只能接受该类型的值
  若只是声明，并没有立刻赋值，则该变量可以接受任意类型值
  与dynamic的区别:dynamic声明的变量若在声明的同时马上赋值，其类型还是动态的，并不会固定为赋值的类型
  */
  var name = 'Voyager I'; //
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print('=========变量=========');
  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

//流程控制语句https://dart.cn/samples#control-flow-statements
void flow_control() {
  print('======流程控制语句======');
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  while (year < 2016) {
    year += 1;
  }
}

//函数https://dart.cn/samples#functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main(List<String> args) {
  variables();
  flow_control();
  var result = fibonacci(20);
  print('=============函数========');
  print('result= $result');
}
