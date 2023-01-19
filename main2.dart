// 1. Dart는 자동으로 main 함수부터 찾는다.
// 2. 세미콜론을 꼭 붙여야한다. -> dart는 일부러 ;을 적지않는 경우가 있기때문에
//    자동으로 ;을 붙여주지 않는다.
void main2() {
  var names; // 컴파일러가 추론해준다 -> 권장하는 방법
  dynamic name; //
  // name = 12;
  // name = true;
  if (name is String) {
    // is type => dynamic->String
    name.length;
  }
  if (name is int) {
    // is type => dynamic->int
    name.isFinite;
  }

  final myName = 'sun'; // final은 type을 고정시킴 = const, 한번만 value를 할당한다
  final String myName2 = 'seon';

  // Nullable Variables
  String? nico = 'nico'; // null이 될 수 있음
  nico = null;
  if (nico != null) {
    nico.isNotEmpty;
  }
  nico?.isNotEmpty; // 위의 문장과 같음

  // late
  late final String name3; //late로 변수를 먼저 만들고 나중에 value를 넣겠다!
  // do something, go to api
  // Data fetching에 빈번하게 사용된다!!! api로 value가 들어올때 값을 입혀줌
  //print(name3); // 접근 불가능-> 아직 value가 없기때문
  name3 = 'nico'; // 이 시점에 value가 결정됨
  //name3 = 12; -> final이라 다른 type은 불가능

  const API =
      '12121212'; // compile-time에 알고있어야하는 값 == 하드코딩되어있음, app 등록전에 이미 알고있는 값 = api key 등

  // List, Map, Set
  // 1. List
  // var numbers = [1, 2, 3, 4, 5];
  var giveMeFive = true;
  List<int> numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, // collection if
  ];
  // collection if와 동일
  // if (giveMeFive) {
  //   numbers.add(5);
  // }

  // String Interpolation
  var name5 = 'nico';
  var age = 10;
  var greeting =
      "Hello everyone, my name is $name5, nice to meet you! and I'm ${age + 2} ${pp()}"; // operation or function
  //print(greeting);

  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "🍖$friend"
  ];
  //print(newFriends);

  // 2. Map
  var player = {
    'name': 'nico',
    'xp': 19.99,
    'superpower': false, // String : Object(any)
  };
  Map<int, bool> player2 = {
    1: true,
    2: false,
    3: true,
  };
  Map<List<int>, bool> player3 = {
    [1, 2, 3, 4, 5]: true,
  };
  // 3. Set
  var numberss = {1, 2, 3, 4}; // 요소는 유니크함 = add(1)을 아무리 많이해도 1은 하나만 존재
  Set<int> numbersss = {1, 23, 4, 6};

  // function
  // print(sayHello('nico'));
  // print(sayHi2(age: 12, country: 'korea', name: 'sun'));

  String? name6;
  name ??= 'nico'; // name이 null이면 nico를 반환
}

String pp() => 'hi';

// String sayHello(String potato) {
//   return "Hello $potato nice to meet you";
// }

String sayHello(String potato) => // 위와 동일
    "Hello $potato nice to meet you"; //fat arrow => 바로 return, one line일 경우 사용
String sayHi(String name, int age, String country) {
  return "hello $name, you are$age, and you come from $country";
} // print('sun','29'..)  비효율!

// name argument
String sayHi2({
  String? name,
  int age = 99,
  required String country,
}) {
  return "hello $name, you are$age, and you come from $country";
}

// positional parameters
String sayHi3(String name, int age,
        [String? country = 'cuba'] // 실행 시 cuba를 입력하지않아도 default 값으로 출력된다.
        ) =>
    "hello $name, you are$age, and you come from $country";

//QQ operator = left??right = null이 아닌 것을 return한다.

// String capitalizeName(String name) => name.toUpperCase();

// null도 입력할 수 있으면 좋겠음 : capitalizeName(null);

// String capitalizeName(String? name) {
//   if (name != null) {
//     return name.toUpperCase();
//   }
//   return 'ANON';
// }

// fatArrow로 표현
String capitalizeName(String? name) =>
    name != null ? name.toUpperCase() : 'ANON';
// 위와 동일
String capitalizeName2(String? name) => name?.toUpperCase() ?? 'ANON';

// Typedef: 자료형에 alias를 붙일수 있게 함, 간단한 데이터 구조
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(List<int> list) {
  // List<int>와 동일
  var reversed = list.reversed;
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;

String sayHii(Map<String, String> userInfo) {
  return "hi ${userInfo['name']}";
}
