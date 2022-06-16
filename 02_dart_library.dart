import 'dart:math';

//数字，集合，字符串等https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more
void dartcore_digital_string() {
  //控制台打印
  print('\n');
  print('#' * 40);
  print('数字、集合、字符串等');
  print('#' * 40);

  // parse()方法将字符串转换为整型或双浮点型对象
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //num的parse()方法
  assert(num.parse('42') == 42);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //添加radix参数，指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);

  //使用 toString()方法将整型或双精度浮点类型转换为字符串类型
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.指定小数点后位数
  assert(123.456.toStringAsFixed(2) == '123.46');

  //指定有效数字位数
  assert(123.456.toStringAsExponential(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式
  //检查字符串中是否包含里一个字符串
  assert('Never odd or even'.contains('odd'));

  //检查字符串的首字符
  assert('Never odd or even'.startsWith('Never'));

  //检查尾字符
  assert('never odd or even'.endsWith('even'));

  //查找字符串在另一个字符串中的位置
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  //获取一个字符串6-9位置的字符串
  assert('Never odd or even'.substring(6, 9) == 'odd');

  //使用空格分隔字符串
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  //Unicode编码 https://www.jianshu.com/p/ba7fb4a651c7
  //获取 UTF-16 code的编码单元
  assert('Never odd or even'[0] == 'N');

  //split()传入空字符参数，并循环输出
  for (final char in 'hello'.split('')) {
    print(char);

    //获取字符串的所有UTF-16编码
    var codeUnitList = 'Never odd or even'.codeUnits.toList();
    assert(codeUnitList[0] == 78);

    //首字母大小写转换
    //小写字母转换尾大写字母
    assert('web apps'.toUpperCase() == 'WEB APPS');

    //大写字母转化为小写
    assert('WEB APPS'.toLowerCase() == 'web apps');

    //trim() 移除首尾空格
    assert('  hello  '.trim() == 'hello');

    //检查字符串是否为空
    assert(''.isEmpty);

    //空格不是空字符串
    assert('  '.isNotEmpty);

    //替换部分字符串
    var greetingTemplate = 'Hello, NAME!';
    var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

    //原字符串greetingTemplate没有改变
    assert(greeting != greetingTemplate);

    //构建一个字符串，'..'用于字符串引用， writeAll() 的第二个参数为可选参数，用来指定分隔符
    var sb = StringBuffer();
    sb
      ..write('Use a StringBuffer for ')
      ..writeAll(['efficient', 'string', 'creation'], ' ')
      ..write('.');

    var fullString = sb.toString();
    assert(fullString == 'Use a StringBuffer for efficient string creation.');
  }

  //正则表达式，匹配一个或多个字符
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  //使用contains()匹配字符串
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  //用另一个字符串替换匹配的字符串
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  //使用 RegExp类，正则表达式进行匹配
  var number = RegExp(r'\d+');
  var someDigit = 'llamas live 15 to 20 years';

  //检查是否匹配
  assert(numbers.hasMatch(someDigit));

  for (final match in number.allMatches(someDigit)) {
    print(match.group(0)); // 15, then 20
  }
}

//列表listhttps://dart.cn/guides/libraries/library-tour#collections
void List_test() {
  //构造一个空list
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  //添加一个元素到列表中
  fruits.add('kiwis');

  //添加多个元素到列表中
  fruits.addAll(['grapes', 'bananas']);

  //获取列表长度
  assert(fruits.length == 5);

  //移动列表中一个元素
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  //移除所有元素
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用下表访问list中元素
  assert(fruits[0] == 'apples');

  //查找元素在list中的下表,indexOf()方法查找一个对象在list中的下标值
  assert(fruits.indexOf('apples') == 0);

  // sort()方法排序一个list
  fruits.sort((a, b) => a.compareTo(b)); //使用compareTo()函数定义比较大小
  assert(fruits[0] == 'apples');

  //使用泛型，指定 list 应该包含的元素类型
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
}

//set是一个无序的，元素唯一的集合
void set_test() {
  //创建一个集合
  var ingredients = <String>{};

  //添加元素到集合中
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  //添加一个重复的元素到集合中是无效的
  ingredients.add('gold');
  assert(ingredients.length == 3);

  //从set中移除一个元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  //使用contains() 和 containsAll() 来检查一个或多个元素是否在set中
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  //检查一个元素是否在set集合中
  assert(ingredients.contains('titanium'));

  //检查多个元素是否在集合中
  assert(ingredients.containsAll(['titanium', 'xenon']));

  //求两个set集合的交集组成的集合
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

//Maps是一个无序的 key-value （键值对）集合,map 将 kay 与 value 关联，以便于检索
void Maps_test() {
  //maps通常使用字符串作为key
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  //maps可以通过构造函数构建
  var searchTerms = Map();

  //maps是参数化类型，可以指定map中key和value的类型
  var nobleGases = Map<int, String>();

  //通过大括号语法可以为 map 添加，获取，设置元素
  nobleGases = {54: 'xenon'};

  //使用key检索value
  assert(nobleGases[54] == 'xenon');

  //检查map中是否包含key
  assert(nobleGases.containsKey(54));

  //移除一个key及其value
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //从一个 map 中检索出所有的 key 或所有的 value
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  //获取的key是一个无序集合
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  //获取的value是一个无序集合
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki'))); //any返回值为bool型

  //containsKey()方法检查一个map中是否包含某个key
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  //构造pickToughestKid()方法
  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  //当且仅当该key不存在于map中，且要为这个key赋值，可使用 putIfAbsent()方法
  teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

//公共集合方法
void the_public_methods() {
  //使用isEmpty和isNotEmpty方法可以检查list，set或map对象中是否包含元素
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //forEach()方法
  teas.forEach((tea) => print('I drink $tea'));

  //map 对象上调用forEach()方法时，函数必须带两个参数（key 和 value）
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at [Waikiki, Kailua, Waimanalo], etc.
  });

  //map() 方法，这个方法将所有结果返回到一个对象中
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 map().toList() 或 map().toSet()，可以强制在每个项目上立即调用函数
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();

  teas = ['green', 'black', 'chamomile', 'earl grey'];

  //洋甘菊不含咖啡因
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // where()方法可以获取所有匹配条件的元素，查找元素，并在指定的函数中返回true
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));

  //使用any()来检查集合中至少含有一个元素满足条件
  assert(teas.any(isDecaffeinated));

  //使用every()方法检查集合中是否所有元素满足条件
  assert(!teas.every(isDecaffeinated));
}

//测试
void collections() {
  print('\n');
  print('#' * 40);
  print('集合');
  print('#' * 40);

  print("========列表=========");
  List_test(); //列表
  print("========集合=========");
  set_test(); //集合
  print("=======哈希映射=======");
  Maps_test(); //哈希映射
  the_public_methods();
}

//编码和解码 URI 组件
//使用encodeComponent()和decodeComponent()方法，对处特殊字符以外的字符进行编解码
void URI_test() {
  print('\n');
  print('#' * 40);
  print('URI组件');
  print('#' * 40);
  //编码some和message之间的空格
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);

  //编码所有字符，例如/被编码为 %2F
  uri = 'https://example.org/api?foo=some message';
  encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);

  //使用Uri对象的字段（例如 path）来获取一个Uri对象或者URI字符串的一部分
  var uri_1 = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri_1.scheme == 'https');
  assert(uri_1.host == 'example.org');
  assert(uri_1.path == '/foo/bar');
  assert(uri_1.fragment == 'frag');
  assert(uri_1.origin == 'https://example.org:8080');

  //使用 Uri() 构造函数，可以将各组件部分构建成URI
  uri_1 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri_1.toString() == 'https://example.org/foo/bar#frag');
}

//日期和时间 https://dart.cn/guides/libraries/library-tour#dates-and-times
void date_time() {
  print('\n');
  print('#' * 40);
  print('时间和日期');
  print('#' * 40);
  //获取当前时刻
  var now = DateTime.now();

  //根据本地时区创建DateTime对象
  var y2k = DateTime(2000); // January 1, 2000

  //指定年月日
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  //将日期指定为UTC时区
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  //指定Unix纪元以来，以毫秒为单位的日期和时间
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

  //解析ISO 8601日期
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  //日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来的毫秒数
  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  //1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  //使用 Duration类来计算两个日期的差，也可以对时刻进行前移和后移操作
  y2k = DateTime.utc(2000);

  //增加一年
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

  //减少30天
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  //计算两个时刻之间的差，返回Duration对象
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
}

//dart:math - 数学和随机数 https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random
void math_random() {
   print('\n');
  print('#' * 40);
  print('数学和随机数');
  print('#' * 40);
  //Math 库提供基本的三角函数
  //Cosine
  assert(cos(pi) == -1.0);

  // Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);

  //radians is now 0.52359.
  var sinOf30degrees = sin(radians);
  //sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);

  //最大值和最小值
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  //math库中常用数学常数
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

  //使用Random类产生随机数
  var random = Random();
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9.

  //也可以随机产生随机布尔值序列
  random = Random();
  random.nextBool(); // true or false
}

void main(List<String> args) {
  dartcore_digital_string(); //数字、集合、字符串类

  collections(); //集合

  URI_test(); // URI组件

  date_time(); //时间和日期

  math_random(); //数学和随机数
}
