// class ❗❗

class Player extends Human {
  // property는 꼭 자료형을 명시해야함
  String name;
  XPLevel xp;
  Team team;

  //named constructor
  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : // ':'으로 초기화
        this.name = name,
        this.team = Team.blue,
        this.xp = XPLevel.beginner;

  Player.createRedPlayer(String name)
      : this.name = name,
        this.team = Team.red,
        this.xp = XPLevel.pro;

  void sayHello() {
    print("Hi my name is ${this.name}");
  }

  @override
  void walk() {
    print('im walking');
  }
}

class Coach extends Human {
  void walk() {
    print('coach walking');
  }
}

void main() {
  // var player = Player.createBluePlayer(
  //   name: "nico",
  //   age: 21,
  // );
  // var redPlayer = Player.createRedPlayer(
  //   "nico",
  //   21,
  // );

  var apiData = [
    {
      "name": "nico",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "sun",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "reo",
      "team": "red",
      "xp": 0,
    },
  ];

  // apiData.forEach((playerJson) {
  //   var player = Player.fromJson(playerJson);
  //   player.sayHello();
  // });

  var nico = Player(
    name: 'nico',
    xp: XPLevel.beginner,
    team: Team.red,
  );
  var potato = nico
    ..name = 'las'
    ..xp = XPLevel.pro
    ..team = Team.blue
    ..sayHello();

  var player = Player2(
    team: Team.red,
    name: 'Jun',
  );
  player.sayHello(); //Human2에 있는 함수

  // mixin class
  var player3 = Player3(
    team: Team.red,
  );
  player3.runQuick();
}

enum Team {
  red,
  blue,
}

enum XPLevel {
  beginner,
  medium,
  pro,
}

// abstract class = 다른 class들이 어떤 청사진을 가지고 있어야하는지 정의해줌
abstract class Human {
  void walk();
}

class Human2 {
  final String name;
  Human2({required this.name});
  void sayHello() {
    print("hi my name is $name");
  }
}

class Player2 extends Human2 {
  final Team team;

  Player2({
    required this.team,
    required String name, // super class에 전달
  }) : super(name: name);
  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${team}');
  }
}

// Mixin class = 여러클래스를 재사용

class Strong {
  final double strenghtLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("ruuuuuun!");
  }
}

class Tall {
  final double height = 1.99;
}

class Player3 with Strong, QuickRunner, Tall {
  final Team team;

  Player3({
    required this.team,
  });
}
